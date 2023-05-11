import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/padded_container.dart';
import '../../../constants.dart';
import '../../../theme.dart';
import '../../../utils/extensions.dart';
import '../domain/crypto_binance_pair.dart';
import '../domain/crypto_ticker.dart';
import 'crypto_order_book.dart';
import 'crypto_pair_candle_chart.dart';
import 'crypto_pair_list.dart';
import 'providers/crypto_asset_provider.dart';

class CryptoPairInfo extends ConsumerWidget {
  const CryptoPairInfo({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final CryptoBinancePair pair;

  Widget buildPriceChange(double? change) {
    if (change == null) return const SizedBox.shrink();
    final color = change >= 0 ? Colors.green : Colors.red;
    return Text(change.asPercentage, style: textTheme().labelLarge?.copyWith(color: color));
  }

  Widget buildSymbolInfo(CryptoTicker ticker) {
    final labelStyle = textTheme().labelSmall?.copyWith(color: blueGrey.shade400);
    final valueStyle =
        textTheme().bodySmall?.copyWith(color: blueGrey.shade600, letterSpacing: -0.5);
    final pairStyle = textTheme().headlineSmall?.copyWith(color: blueGrey.shade600);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rich text with baseAsset and smaller size text quoteAsset
              RichText(
                text: TextSpan(
                  text: '${pair.baseAsset}/',
                  style: pairStyle,
                  children: [
                    TextSpan(
                      text: pair.quoteAsset,
                      style: pairStyle?.copyWith(color: blueGrey.shade500),
                    ),
                  ],
                ),
              ),
              // Text('${pair.baseAsset}/${pair.quoteAsset}',
              //     style: textTheme().headlineSmall?.copyWith(color: blueGrey.shade600)),
              const SizedBox(width: 4),
              Text(pair.priceQuote.asCryptoDecimal,
                  style: textTheme().bodyLarge?.copyWith(color: blueGrey.shade600)),
              const SizedBox(width: 4),
              buildPriceChange(ticker.priceChangePercent),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('24h High', style: labelStyle),
                  const SizedBox(height: 2),
                  Text(ticker.highPrice.asCryptoDecimal, style: valueStyle),
                  const SizedBox(height: 4),
                  Text('24h Low', style: labelStyle),
                  const SizedBox(height: 2),
                  Text(ticker.lowPrice.asCryptoDecimal, style: valueStyle),
                ],
              ),
              const SizedBox(width: 6),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('24h Vol(${pair.baseAsset})', style: labelStyle),
                  const SizedBox(height: 2),
                  Text(ticker.volume.asCompact, style: valueStyle),
                  const SizedBox(height: 4),
                  Text('24h Vol(${pair.quoteAsset})', style: labelStyle),
                  const SizedBox(height: 2),
                  Text(ticker.quoteVolume.asCompact, style: valueStyle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchTickerProvider(pair.symbol)).when(
          loading: () =>
              const SizedBox(height: 75.8, child: Center(child: CircularProgressIndicator())),
          error: (e, s) => Text(e.toString()),
          data: (data) => buildSymbolInfo(data),
        );
  }
}

class CryptoPairView extends HookConsumerWidget {
  const CryptoPairView({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final CryptoBinancePair pair;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(cryptoExpandPairsProvider);
    final expandNotifier = ref.watch(cryptoExpandPairsProvider.notifier);
    return Container(
      margin: sideMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaddedContainer(
            padding: graphInnerSpacing,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CryptoPairInfo(pair: pair),
                const SizedBox(height: 8),
                SizedBox(
                  height: graphHeight,
                  child: CryptoPairCandleChart(pair: pair),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Stack(
              children: [
                Row(
                  children: [
                    const PaddedContainer(
                      child: SizedBox(width: CryptoPairBox.width),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: isExpanded ? () => expandNotifier.collapse() : null,
                        onVerticalDragDown: isExpanded ? (_) => expandNotifier.collapse() : null,
                        onVerticalDragStart: isExpanded ? (_) => expandNotifier.collapse() : null,
                        child: PaddedContainer(
                          foregroundColor: Colors.grey.withOpacity(isExpanded ? 0.5 : 0.0),
                          child: CryptoOrderBook(symbol: pair.symbol),
                        ),
                      ),
                    ),
                  ],
                ),
                PaddedContainer(
                  child: CryptoPairList(assetSymbol: pair.baseAsset),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
