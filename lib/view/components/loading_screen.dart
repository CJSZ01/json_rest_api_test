import 'package:api_test_caio/view/assets.dart';
import 'package:api_test_caio/view/components/base_screen.dart';
import 'package:api_test_caio/view/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  final String animationPath;
  final bool repeat;
  final String message;
  LoadingScreen({super.key})
      : animationPath = AppAssets.loading,
        repeat = true,
        message = 'Por favor aguarde';
  LoadingScreen.error({
    super.key,
    required this.message,
  })  : animationPath = AppAssets.error,
        repeat = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BaseScreen(
        backgroundPosition: BackgroundPosition.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: repeat == false ? 58 : 20,
            ),
            LottieBuilder.asset(
              animationPath,
              repeat: repeat,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextstyles.buttonMedium,
            ),
          ],
        ),
      ),
    );
  }
}
