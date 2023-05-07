import 'package:api_test_caio/view/routes.dart';
import 'package:api_test_caio/view/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'view/pages/landing/landing_page.dart';

class ApiTestApp extends StatelessWidget {
  const ApiTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: const LandingPage(),
      routes: AppRoutes.routes,
    );
  }
}
