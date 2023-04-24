import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({
    required this.text,
    this.style,
    this.color,
    this.innerPadding = 0,
    this.outerPadding = 0,
    Key? key
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final Color? color;
  final double innerPadding;
  final double outerPadding;

  @override
  Widget build(BuildContext context) {
    final textColor = color ?? Colors.grey;
    final textStyle = style ?? TextStyle(color: textColor);
    final dividerColor = Color.lerp(textColor, Colors.white, 0.7)!;
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: outerPadding, right: innerPadding),
                child: Divider(color: dividerColor),
              )
          ),
          Text(text, style: textStyle),
          Expanded(
              child: Container(
                padding: EdgeInsets.only(left: innerPadding, right: outerPadding),
                child: Divider(color: dividerColor),
              )
          ),
        ],
      )
    );
  }

}