import 'package:flutter/material.dart';

import '../constants.dart';

class PaddedContainer extends StatelessWidget {
  const PaddedContainer({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.margin,
    this.padding = innerSpacing,
    this.color = Colors.white,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: circularBorder,
      ),
      child: child,
    );
  }
}
