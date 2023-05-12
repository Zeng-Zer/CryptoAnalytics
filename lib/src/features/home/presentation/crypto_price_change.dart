import 'package:flutter/material.dart';

import '../../../utils/extensions.dart';

class CryptoPriceChange extends StatelessWidget {
  const CryptoPriceChange({
    Key? key,
    required this.change,
    required this.style,
    this.iconUp = Icons.trending_up,
    this.iconDown = Icons.trending_down,
  }) : super(key: key);

  final double change;
  final TextStyle? style;
  final IconData iconUp;
  final IconData iconDown;

  @override
  Widget build(BuildContext context) {
    final color = change >= 0 ? Colors.green : Colors.red;
    final changeAbs = change.abs();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          change >= 0 ? iconUp : iconDown,
          color: color,
          size: 24,
        ),
        const SizedBox(width: 4),
        Text(changeAbs.asPercentage, style: style?.copyWith(color: color)),
      ],
    );
  }
}
