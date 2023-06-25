import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/svg_logo_string.dart';
import '../../crypto_list/domain/crypto_asset.dart';
import '../providers/crypto_favorite_provider.dart';
import '../providers/crypto_info_provider.dart';
import 'crypto_info_view.dart';
import 'crypto_pair_view.dart';

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

    buildTitle() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgLogoString(logo: asset.logoSvg, size: 24),
          const SizedBox(width: 8),
          Flexible(child: Text(asset.name, overflow: TextOverflow.ellipsis)),
        ],
      );
    }

    const visualDensity = VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: -2.0);
    buildCandleAction() {
      return IconButton(
          visualDensity: visualDensity,
          iconSize: 24,
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
          ));
    }

    buildFavoriteAction() {
      final favoriteCtrl = ref.watch(cryptoFavoriteProvider(asset.symbol));
      final isFavorite = favoriteCtrl.valueOrNull;
      final onPressed = isFavorite == null
          ? null
          : () {
              if (isFavorite) {
                ref.read(cryptoFavoriteProvider(asset.symbol).notifier).remove();
              } else {
                ref.read(cryptoFavoriteProvider(asset.symbol).notifier).add();
              }
            };
      return IconButton(
        visualDensity: visualDensity,
        iconSize: 20,
        onPressed: onPressed,
        icon: Icon(isFavorite == true ? Icons.favorite : Icons.favorite_border),
      );
    }

    buildPages() {
      return [
        CryptoInfoView(asset: asset),
        selectedPair != null ? CryptoPairView(pair: selectedPair) : const SizedBox(),
      ];
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: buildTitle(),
        actions: [
          buildCandleAction(),
          buildFavoriteAction(),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: buildPages(),
        ),
      ),
      // TODO reposition FAB 10px above
      // transition to new page with FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.campaign),
      ),
    );
  }
}
