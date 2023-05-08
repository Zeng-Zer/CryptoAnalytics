import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/svg_logo_string.dart';
import '../domain/crypto_asset.dart';
import 'crypto_info_view.dart';
import 'crypto_pair_view.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPair = ref.watch(cryptoPairSelectionProvider(asset.symbol));
    final selectedState = ref.watch(cryptoPriceOrCandleSelectionProvider);
    final pageController = usePageController(initialPage: selectedState.index);

    final title = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgLogoString(logo: asset.logoSvg, size: 24),
        const SizedBox(width: 8),
        Text(asset.name),
      ],
    );

    final actions = [
      IconButton(
        onPressed: selectedPair == null
            ? null
            : () {
                final newState = ref.read(cryptoPriceOrCandleSelectionProvider.notifier).toggle();
                pageController.jumpToPage(newState.index);
              },
        icon: Icon(
          selectedState == PriceCandleState.price
              ? Icons.candlestick_chart_outlined
              : Icons.attach_money,
        ),
      )
    ];

    final pages = [
      CryptoInfoView(asset: asset),
      selectedPair != null ? CryptoPairView(pair: selectedPair) : const SizedBox(),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: title,
        actions: actions,
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
    );
  }
}
