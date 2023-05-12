import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/padded_container.dart';
import '../../../constants.dart';
import '../../../theme.dart';
import '../domain/crypto_asset.dart';
import 'crypto_asset_price_graph.dart';
import 'crypto_trades_view.dart';

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
            padding: graphInnerSpacing,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CryptoAssetPriceChartHeader(assetId: asset.id),
                const SizedBox(height: 8),
                SizedBox(
                  height: graphHeight,
                  child: CryptoAssetPriceGraph(assetId: asset.id),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: PaddedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Realtime trades',
                      style: textTheme().titleMedium?.copyWith(color: blueGrey.shade600),
                    ),
                  ),
                  const Divider(indent: 10, endIndent: 10),
                  Expanded(child: CryptoTradesView(assetId: asset.id)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
