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
  }) : super(key: key);

  static const height = 64.0;
  static const logoSize = 16.0;

  final CryptoBinancePair pair;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();

    const borderRadius = BorderRadius.all(Radius.circular(12));
    final isSelected = ref.watch(cryptoPairSelectionProvider) == pair;
    return Container(
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
                  ref.read(cryptoPairSelectionProvider.notifier).select(pair);
                  print('selected pair ${pair.baseAsset} ${pair.baseAsset}');
                },
          borderRadius: borderRadius,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CryptoExchangePair(
                  pair: pair,
                  logoSize: logoSize,
                  textStyle: textTheme().labelMedium?.copyWith(color: blueGrey.shade600),
                ),
                const SizedBox(height: 8),
                Text(pair.priceQuote.asCryptoDecimal),
                const SizedBox(height: 2),
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
    required this.assetId,
    required this.assetSymbol,
  }) : super(key: key);

  final String assetId;
  final String assetSymbol;
  final int limit = 20;

  Widget buildPairList(WidgetRef ref, List<CryptoBinancePair> pairs) {
    final noSelectedPair = ref.watch(cryptoPairSelectionProvider.select((value) => value == null));
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: pairs.length,
      itemBuilder: (context, index) {
        if (noSelectedPair && index == 0) {
          Future(() => ref.read(cryptoPairSelectionProvider.notifier).select(pairs.first));
        }
        final pair = pairs[index];
        if (pair.priceQuote == 0) return const SizedBox();
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (index != 0) const SizedBox(width: 8),
            CryptoPairBox(pair: pair),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pairs = ref.watch(fetchBinancePairsByBaseSymbolProvider(assetSymbol));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
            height: CryptoPairBox.height,
            child: pairs.when(
              skipLoadingOnReload: true,
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (pairs) => buildPairList(ref, pairs),
            )),
      ),
    );
  }
}
