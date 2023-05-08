import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/padded_container.dart';
import '../../../constants.dart';
import '../domain/crypto_binance_pair.dart';
import 'crypto_order_book.dart';
import 'crypto_pair_candle_chart.dart';
import 'crypto_pair_list.dart';

class CryptoPairView extends HookConsumerWidget {
  const CryptoPairView({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final CryptoBinancePair pair;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: sideMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaddedContainer(
            height: graphHeight,
            padding: graphInnerSpacing,
            child: CryptoPairCandleChart(pair: pair),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Row(
              children: [
                PaddedContainer(
                  child: CryptoPairList(assetSymbol: pair.baseAsset),
                ),
                PaddedContainer(
                  child: CryptoOrderBook(symbol: pair.symbol),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
