import 'package:flutter/material.dart';
import '../core/constacts/color.dart';
import '../core/constacts/spacing.dart';
import '../core/constacts/text_style.dart';


class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    fontFamily: 'NotoSans',
    // =========================
    // Global Colors
    // =========================
    scaffoldBackgroundColor: AppColors.scaffoldBg,
    primaryColor: AppColors.primaryBlue,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryBlue,
      secondary: AppColors.secondaryOrange,
      error: AppColors.error,
      background: AppColors.scaffoldBg,
      surface: AppColors.cardBg,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: AppColors.headingText,
      onSurface: AppColors.bodyText,
    ),

    // =========================
    // AppBar Theme
    // =========================
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.h4,
      iconTheme: IconThemeData(color: AppColors.headingText),
    ),

    // =========================
    // Text Theme
    // =========================
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.h1,
      displayMedium: AppTextStyles.h2,
      displaySmall: AppTextStyles.h3,
      headlineMedium: AppTextStyles.h4,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.button,
    ),

    // =========================
    // Elevated Button (Primary CTA)
    // =========================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.button,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
      ),
    ),

    // =========================
    // Outlined Button (Secondary CTA)
    // =========================
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryBlue,
        textStyle: AppTextStyles.button.copyWith(
          color: AppColors.primaryBlue,
        ),
        side: const BorderSide(color: AppColors.primaryBlue),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
      ),
    ),

    // =========================
    // Text Button (Links / Minimal)
    // =========================
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.linkText,
        textStyle: AppTextStyles.link,
      ),
    ),

    // =========================
    // Input Fields (Forms)
    // =========================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        borderSide: const BorderSide(
          color: AppColors.primaryBlue,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      labelStyle: AppTextStyles.body,
      hintStyle: AppTextStyles.bodySmall,
    ),

    // =========================
    // Card Theme
    // =========================
    // cardTheme: CardTheme(
    //   color: AppColors.cardBg,
    //   elevation: 2,
    //   shadowColor: Colors.black12,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
    //   ),
    //   margin: const EdgeInsets.all(AppSpacing.sm),
    // ),

    // =========================
    // Divider
    // =========================
    dividerTheme: const DividerThemeData(
      color: AppColors.border,
      thickness: 1,
      space: AppSpacing.lg,
    ),

    // =========================
    // Checkbox / Switch (Admin Use)
    // =========================
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primaryBlue),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.primaryBlue),
      trackColor: MaterialStateProperty.all(
        AppColors.primaryBlue.withOpacity(0.3),
      ),
    ),
  );
}
