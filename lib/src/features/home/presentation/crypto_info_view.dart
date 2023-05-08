import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/padded_container.dart';
import '../../../constants.dart';
import '../domain/crypto_asset.dart';
import 'crypto_asset_price_graph.dart';

class CryptoInfoView extends HookConsumerWidget {
  const CryptoInfoView({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final CryptoAsset asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: sideMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaddedContainer(
            child: CryptoAssetPriceChartHeader(assetId: asset.id),
          ),
          const SizedBox(height: 8),
          PaddedContainer(
            height: graphHeight,
            padding: graphInnerSpacing,
            child: CryptoAssetPriceGraph(assetId: asset.id),
          ),
          Text(asset.symbol),
        ],
      ),
    );
  }
}
