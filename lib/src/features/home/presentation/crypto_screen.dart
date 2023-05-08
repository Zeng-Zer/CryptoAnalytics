import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/svg_logo_string.dart';
import '../domain/crypto_asset.dart';
import '../domain/crypto_binance_pair.dart';
import 'crypto_asset_price_graph.dart';
import 'crypto_exchange_pair.dart';
import 'crypto_pair_candle_chart.dart';
import 'crypto_pair_list.dart';
import 'providers/crypto_asset_provider.dart';

enum PriceCandleState {
  price,
  candle,
}

@RoutePage()
class CryptoScreen extends HookConsumerWidget {
  const CryptoScreen({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final CryptoAsset asset;

  TabBar buildTabBar(WidgetRef ref, CryptoBinancePair? selectedPair) {
    const tabHeight = 54.0;
    const iconSize = 20.0;
    return TabBar(
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      tabs: [
        const Tab(
          height: tabHeight,
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.attach_money, size: iconSize),
                SizedBox(height: 4),
                Text('Price'),
              ],
            ),
          ),
        ),
        Tab(
          height: tabHeight,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                const Icon(Icons.candlestick_chart_outlined, size: iconSize),
                const SizedBox(height: 4),
                if (selectedPair != null)
                  CryptoExchangePair(
                    pair: selectedPair,
                    logoSize: 16,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTabBarView(CryptoBinancePair? selectedPair) {
    return SizedBox(
      height: 400,
      child: TabBarView(
        children: [
          CryptoAssetPriceGraph(assetId: asset.id),
          selectedPair != null ? CryptoPairCandleChart(pair: selectedPair) : const SizedBox(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPair = ref.watch(cryptoPairSelectionProvider);
    final selectedPriceCandleState = ref.watch(cryptoPriceOrCandleSelectionProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgLogoString(logo: asset.logoSvg, size: 24),
              const SizedBox(width: 8),
              Text(asset.name),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(cryptoPriceOrCandleSelectionProvider.notifier).toggle();
              },
              icon: Icon(
                selectedPriceCandleState == PriceCandleState.price
                    ? Icons.candlestick_chart_outlined
                    : Icons.attach_money,
              ),
            ),
          ],
          bottom: buildTabBar(ref, selectedPair),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              buildTabBarView(selectedPair),
              const SizedBox(height: 8),
              CryptoPairList(assetId: asset.id, assetSymbol: asset.symbol),
            ],
          ),
        ),
      ),
    );
  }
}
