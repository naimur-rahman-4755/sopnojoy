import 'package:flutter/material.dart';

class ImpactLoadingState extends StatelessWidget {
  const ImpactLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}