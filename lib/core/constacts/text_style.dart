import 'package:flutter/material.dart';

import 'color.dart';

class AppTextStyles {

  // Headings


  static const TextStyle h1 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.headingText,
    height: 1.3,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.headingText,
    height: 1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.headingText,
    height: 1.4,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.headingText,
  );


  // Body Text


  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.bodyText,
    height: 1.6,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.bodyText,
    height: 1.6,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    color: AppColors.bodyText,
  );


  // Buttons

  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Links

  static const TextStyle link = TextStyle(
    fontSize: 14,
    color: AppColors.linkText,
    decoration: TextDecoration.underline,
  );


  // Admin / Utility

  static const TextStyle sidebarTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle sidebarItem = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  static const TextStyle pageTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.headingText,
  );
}
