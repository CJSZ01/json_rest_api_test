import 'package:api_test_caio/view/components/base_screen.dart';
import 'package:api_test_caio/view/routes.dart';
import 'package:api_test_caio/view/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: Text('Login', style: AppTextstyles.buttonLarge),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.home);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signup);
              },
              child: Text('Cadastro', style: AppTextstyles.buttonLarge),
            ),
          ],
        ),
      ),
    );
  }
}
