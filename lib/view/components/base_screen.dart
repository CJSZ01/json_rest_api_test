import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:api_test_caio/view/assets.dart';

enum BackgroundPosition { left, right, center }

class BaseScreen extends StatelessWidget {
  const BaseScreen(
      {Key? key,
      required this.child,
      this.backgroundPosition = BackgroundPosition.left})
      : super(key: key);
  final Widget child;
  final BackgroundPosition backgroundPosition;

  @override
  Widget build(BuildContext context) {
    String background = BackgroundPosition.left.name;
    switch (backgroundPosition) {
      case BackgroundPosition.left:
        background = AppAssets.backgroundLeft;
        break;
      case BackgroundPosition.right:
        background = AppAssets.backgroundRight;
        break;
      case BackgroundPosition.center:
        background = AppAssets.backgroundCenter;
        break;
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          background,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ],
    );
  }
}
