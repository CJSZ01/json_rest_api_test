import 'package:api_test_caio/utils/locator/locator.dart';
import 'package:api_test_caio/view/pages/home/home_cubit.dart';
import 'package:api_test_caio/view/pages/home/home_page.dart';
import 'package:api_test_caio/view/pages/landing/landing_page.dart';
import 'package:api_test_caio/view/pages/signup/signup_cubit.dart';
import 'package:api_test_caio/view/pages/signup/signup_page.dart';
import 'package:flutter/material.dart' show WidgetBuilder;
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  AppRoutes._();

  static String landing = 'landing';
  static String signup = 'signup';
  static String login = 'login';
  static String home = 'home';

  static Map<String, WidgetBuilder> get routes => {
        landing: (context) => const LandingPage(),
        signup: (context) => BlocProvider(
            create: (context) => SignupCubit(
                  userRepository: serviceLocator.get(),
                ),
            child: const SignupPage()),
        home: (context) => BlocProvider(
            create: (context) => HomeCubit(
                  userRepository: serviceLocator.get(),
                )..getUsers(),
            child: const HomePage()),
      };
}
