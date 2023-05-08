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

  static const width = 120.0;
  static const baseLogoSize = 20.0;
  static const quoteLogoSize = 12.0;

  final CryptoBinancePair pair;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();

    const borderRadius = BorderRadius.all(Radius.circular(12));
    final isSelected = ref.watch(cryptoPairSelectionProvider(pair.baseAsset)) == pair;
    return Container(
      width: width,
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
                  print('selected pair ${pair.baseAsset} ${pair.baseAsset}');
                },
          borderRadius: borderRadius,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CryptoExchangePair(
                  pair: pair,
                  baseLogoSize: baseLogoSize,
                  quoteLogoSize: quoteLogoSize,
                  textStyle: textTheme().labelSmall?.copyWith(color: blueGrey.shade600),
                ),
                const SizedBox(height: 8),
                Text(
                  pair.priceQuote.asCryptoDecimal,
                  overflow: TextOverflow.ellipsis,
                ),
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

  Widget buildHeader() {
    return Container(
      alignment: Alignment.center,
      width: CryptoPairBox.width,
      padding: const EdgeInsets.all(4),
      child: Text(
        'Pairs | Price',
        style: textTheme().titleSmall?.copyWith(color: blueGrey.shade500),
      ),
    );
  }

  Widget buildPairList(WidgetRef ref, List<CryptoBinancePair> pairs) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 4),
      itemCount: pairs.length,
      itemBuilder: (context, index) {
        final pair = pairs[index];
        if (pair.priceQuote == 0) return const SizedBox();
        return CryptoPairBox(pair: pair);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pairs = ref.watch(fetchBinancePairsByBaseSymbolProvider(assetSymbol));
    return pairs.when(
      skipLoadingOnReload: true,
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (pairs) => SizedBox(
        width: CryptoPairBox.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeader(),
            const Divider(indent: 10, endIndent: 10),
            Expanded(child: buildPairList(ref, pairs)),
          ],
        ),
      ),
    );
  }
}
