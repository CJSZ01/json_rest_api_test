import 'package:api_test_caio/view/theme/app_colors.dart';
import 'package:api_test_caio/view/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    textTheme: GoogleFonts.montserratTextTheme(),
    scaffoldBackgroundColor: AppColors.secondary,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.secondaryDarker),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(16),
        ),

        elevation: MaterialStateProperty.all(2),
        side: MaterialStateProperty.all(
          BorderSide(color: AppColors.secondaryDark, width: 4),
        ),
        // backgroundColor: MaterialStateProperty.all(AppColors.primaryDark),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(16),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.white,
      filled: true,
      floatingLabelStyle: AppTextstyles.inputLabel,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: AppColors.secondaryDarker,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: AppColors.white,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.white),
      ),
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (dynamic _) => const FadeUpwardsPageTransitionsBuilder(),
      ),
    ),
  );
}
