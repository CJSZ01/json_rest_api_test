import 'package:flutter/material.dart' show TextStyle, Color, Shadow, Offset;

extension Outlined on TextStyle {
  TextStyle outlined(Color color) {
    return copyWith(
      shadows: [
        Shadow(offset: const Offset(-1.5, -1.5), color: color),
        Shadow(offset: const Offset(1.5, -1.5), color: color),
        Shadow(offset: const Offset(1.5, 1.5), color: color),
        Shadow(offset: const Offset(-1.5, 1.5), color: color),
      ],
    );
  }
}
