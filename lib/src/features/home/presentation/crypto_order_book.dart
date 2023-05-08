import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CryptoOrderBook extends HookConsumerWidget {
  const CryptoOrderBook({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  final String symbol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox();
  }
}
