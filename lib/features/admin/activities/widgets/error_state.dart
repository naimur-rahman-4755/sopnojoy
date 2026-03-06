import 'package:flutter/material.dart';

class ImpactErrorState extends StatelessWidget {

  final String message;

  const ImpactErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Icon(Icons.error_outline, size: 40),

          const SizedBox(height: 12),

          Text(message),

        ],
      ),
    );
  }
}