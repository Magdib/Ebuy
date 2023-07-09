import 'package:ebuy/core/localization/handleLanguageApi.dart';
import 'package:flutter/material.dart';

class HandlePosition extends StatelessWidget {
  const HandlePosition(
      {super.key,
      this.left,
      this.right,
      required this.child,
      this.bottom,
      this.top});
  final double? left;
  final double? right;
  final double? bottom;
  final double? top;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    double? uileft = left;
    double? uiright = right;
    bool isenglish = getLanguage();

    if (isenglish == false) {
      uileft = right;
      uiright = left;
    }
    return Positioned(
      left: uileft,
      right: uiright,
      bottom: bottom,
      top: top,
      child: child,
    );
  }
}

EdgeInsets handleEdgeInsets(
    double top, double bottom, double left, double right) {
  double? uileft = left;
  double? uiright = right;

  bool isenglish = getLanguage();

  if (isenglish == false) {
    uileft = right;
    uiright = left;
  }
  return EdgeInsets.only(
      bottom: bottom, left: uileft, right: uiright, top: top);
}
