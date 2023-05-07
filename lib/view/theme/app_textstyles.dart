import 'package:api_test_caio/utils/extensions/outlined_text.dart';
import 'package:api_test_caio/view/theme/app_colors.dart';
import 'package:flutter/widgets.dart' show FontWeight, TextStyle;

class AppTextstyles {
  AppTextstyles._();
  static TextStyle get buttonMedium =>
      TextStyle(color: AppColors.white, fontSize: 24);
  static TextStyle get buttonLarge =>
      TextStyle(color: AppColors.white, fontSize: 36);

  static TextStyle get inputLabel => TextStyle(
        color: AppColors.secondaryDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ).outlined(AppColors.white);

  static TextStyle get listLabel => TextStyle(
        color: AppColors.secondaryDarker,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
}
