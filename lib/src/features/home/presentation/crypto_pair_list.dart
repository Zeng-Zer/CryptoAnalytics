import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme.dart';
import '../../../utils/extensions.dart';
import '../domain/crypto_binance_pair.dart';
import 'crypto_exchange_pair.dart';
import 'providers/crypto_asset_provider.dart';

class CryptoPairBox extends HookConsumerWidget {
  const CryptoPairBox({
    Key? key,
    required this.pair,
    required this.isExpanded,
  }) : super(key: key);

  static const expandedWidth = 200.0;
  static const width = 82.0;
  static const animationDuration = Duration(milliseconds: 400);

  final CryptoBinancePair pair;
  final bool isExpanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();

    const borderRadius = BorderRadius.all(Radius.circular(12));
    final isSelected = ref.watch(cryptoPairSelectionProvider(pair.baseAsset)) == pair;
    return AnimatedContainer(
      duration: animationDuration,
      decoration: BoxDecoration(
        color: !isSelected ? violet.shade50 : violet.shade200.withOpacity(0.7),
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isSelected
              ? null
              : () {
                  ref.read(cryptoPairSelectionProvider(pair.baseAsset).notifier).select(pair);
                  ref.read(cryptoExpandPairsProvider.notifier).collapse();
                  print('selected pair ${pair.baseAsset} ${pair.baseAsset}');
                },
          borderRadius: borderRadius,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CryptoExchangePair(
                  isExpanded: isExpanded,
                  pair: pair,
                  logoSize: 14,
                ),
                if (isExpanded) ...[
                  const Spacer(),
                  Text(
                    pair.priceQuote.asCryptoDecimal,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme().labelSmall,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CryptoPairList extends HookConsumerWidget {
  const CryptoPairList({
    Key? key,
    required this.assetSymbol,
  }) : super(key: key);

  final String assetSymbol;

  Widget buildHeader(CryptoExpandPairs expandNotifier, bool isExpanded) {
    final icon = isExpanded ? Icons.keyboard_double_arrow_left : Icons.keyboard_double_arrow_right;
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('Pairs', style: textTheme().titleSmall?.copyWith(color: blueGrey.shade500)),
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            icon: Icon(icon, color: blueGrey.shade500),
            iconSize: 20,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            onPressed: () => expandNotifier.toggle(),
          ),
        ),
      ],
    );
  }

  Widget buildPairList(List<CryptoBinancePair> pairs, bool isExpanded) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 4),
      itemCount: pairs.length,
      itemBuilder: (context, index) {
        final pair = pairs[index];
        if (pair.priceQuote == 0) return const SizedBox();
        return CryptoPairBox(pair: pair, isExpanded: isExpanded);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pairs = ref.watch(fetchBinancePairsByBaseSymbolProvider(assetSymbol));
    final expandNotifier = ref.read(cryptoExpandPairsProvider.notifier);
    final isExpanded = ref.watch(cryptoExpandPairsProvider);
    return pairs.when(
      skipLoadingOnReload: true,
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (pairs) => SizedBox(
        // duration: CryptoPairBox.animationDuration,
        width: isExpanded ? CryptoPairBox.expandedWidth : CryptoPairBox.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            buildHeader(expandNotifier, isExpanded),
            const Divider(indent: 10, endIndent: 10),
            Expanded(child: buildPairList(pairs, isExpanded)),
          ],
        ),
      ),
    );
  }
}
