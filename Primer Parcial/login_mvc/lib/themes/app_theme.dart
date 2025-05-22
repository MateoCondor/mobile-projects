import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        tertiary: AppColors.accent,
        background: AppColors.background,
        surface: AppColors.card,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: AppColors.text,
        onSurface: AppColors.text,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      cardColor: AppColors.card,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.text,
          fontFamily: 'Poppins',
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          color: AppColors.textLight,
          fontFamily: 'Poppins',
          fontSize: 14,
        ),
        titleLarge: TextStyle(
          color: AppColors.text,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        headlineMedium: TextStyle(
          color: AppColors.primary,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.card,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        hintStyle: TextStyle(color: AppColors.textLight),
        prefixIconColor: AppColors.secondary,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.primary.withOpacity(0.5);
            }
            return AppColors.primary;
          }),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(AppColors.secondary),
        checkColor: MaterialStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      cardTheme: CardTheme(
        color: AppColors.card,
        elevation: 2,
        shadowColor: AppColors.cardShadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.text,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.primary,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.primary, size: 24),
      dividerTheme: const DividerThemeData(
        color: Color(0xFFE2E8F0),
        thickness: 1,
        space: 32,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.text,
        contentTextStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Método para obtener un BoxDecoration con gradiente
  static BoxDecoration gradientBackground({bool isVertical = true}) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: AppColors.backgroundGradient,
        begin: isVertical ? Alignment.topCenter : Alignment.centerLeft,
        end: isVertical ? Alignment.bottomCenter : Alignment.centerRight,
      ),
    );
  }

  // Método para botones con gradiente
  static BoxDecoration gradientButton() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: AppColors.primaryGradient,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
