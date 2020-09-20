import 'package:expay/util/ui_scale.dart';
import 'package:flutter/material.dart';

class UIIcon {
  static Widget contactless({double size, Color color = Colors.white}) {
    size ??= UIScale.height(2);
    return SizedBox(
      height: size,
      width: size,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
        child: RotatedBox(quarterTurns: 0, child: Image.asset("assets/icons/contactless.png")),
      ),
    );
  }
}
