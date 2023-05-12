import 'package:flutter/material.dart';

import '../constants.dart';

class PaddedContainer extends StatelessWidget {
  const PaddedContainer({
    Key? key,
    this.child,
    this.height,
    this.width,
    this.margin,
    this.padding = innerSpacing,
    this.color = Colors.white,
    this.foregroundColor,
  }) : super(key: key);

  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color color;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      foregroundDecoration: foregroundColor != null
          ? BoxDecoration(
              color: foregroundColor,
              borderRadius: circularBorder,
            )
          : null,
      decoration: BoxDecoration(
        color: color,
        borderRadius: circularBorder,
      ),
      child: child,
    );
  }
}
