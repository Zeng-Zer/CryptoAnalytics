import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SvgLogoString extends ConsumerWidget {
  const SvgLogoString({
    Key? key,
    required this.logo,
    required this.size,
  }) : super(key: key);

  final String? logo;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return logo.toOption().match(
          () => SizedBox(height: size, width: size),
          (svg) => SvgPicture.string(svg, height: size, width: size),
        );
  }
}
