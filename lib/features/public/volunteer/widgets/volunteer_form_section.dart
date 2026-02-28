import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../../../../core/provider/volunteer_provider.dart';
import '../model/volunteer_application_model.dart';

class VolunteerFormSection extends ConsumerStatefulWidget {
  const VolunteerFormSection({super.key});

  @override
  ConsumerState<VolunteerFormSection> createState() =>
      _VolunteerFormSectionState();
}

class _VolunteerFormSectionState
    extends ConsumerState<VolunteerFormSection> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  String? _interest;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(volunteerApplicationProvider);
    final isLoading = state.isLoading;

    ref.listen(volunteerApplicationProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration submitted successfully')),
          );
          _formKey.currentState?.reset();
          _nameController.clear();
          _phoneController.clear();
          _emailController.clear();
          setState(() => _interest = null);
        },
        error: (e, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        },
      );
    });

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl,
        horizontal: AppSpacing.md,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(
            children: [
              Text('Volunteer Registration', style: AppTextStyles.h2),
              const SizedBox(height: AppSpacing.sm),
              Text(
                "Fill out this form and we'll get in touch with you soon",
                style: AppTextStyles.body,
              ),
              const SizedBox(height: AppSpacing.xl),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppSpacing.radiusLg),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _Field(
                          controller: _nameController,
                          label: 'Full Name *',
                          hint: 'Enter your full name',
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _Field(
                          controller: _phoneController,
                          label: 'Phone Number *',
                          hint: 'Enter your phone number',
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _Field(
                          controller: _emailController,
                          label: 'Email Address *',
                          hint: 'Enter your email',
                          isEmail: true,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Area of Interest *',
                            labelStyle:
                            const TextStyle(color: AppColors.primaryBlue),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(15),
                            ),
                          ),
                          value: _interest,
                          items: const [
                            DropdownMenuItem(
                                value: 'Field Volunteer',
                                child: Text('Field Volunteer')),
                            DropdownMenuItem(
                                value: 'Event Organizer',
                                child: Text('Event Organizer')),
                            DropdownMenuItem(
                                value: 'Medical Support',
                                child: Text('Medical Support')),
                            DropdownMenuItem(
                                value: 'Fundraising',
                                child: Text('Fundraising')),
                          ],
                          onChanged: isLoading
                              ? null
                              : (v) => setState(() => _interest = v),
                          validator: (v) =>
                          v == null ? 'Required' : null,
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () async {
                              if (!_formKey.currentState!
                                  .validate()) return;

                              final application =
                              VolunteerApplication(
                                fullName:
                                _nameController.text.trim(),
                                phone:
                                _phoneController.text.trim(),
                                email:
                                _emailController.text.trim(),
                                areaOfInterest: _interest!,
                              );

                              await ref
                                  .read(
                                  volunteerApplicationProvider
                                      .notifier)
                                  .submit(application);
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                              const EdgeInsets.symmetric(
                                  vertical: 14),
                              backgroundColor:
                              AppColors.primaryBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(25),
                              ),
                            ),
                            child: isLoading
                                ? const SizedBox(
                              height: 18,
                              width: 18,
                              child:
                              CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                                : const Text(
                              'Submit Registration',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isEmail;

  const _Field({
    required this.controller,
    required this.label,
    required this.hint,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (v) {
        if (v == null || v.trim().isEmpty) return 'Required';
        if (isEmail &&
            !RegExp(r'^[^@]+@[^@]+\.[^@]+')
                .hasMatch(v.trim())) {
          return 'Enter valid email';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppSpacing.radiusLg),
        ),
      ),
    );
  }
}