import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme.dart';
import '../../../utils/extensions.dart';
import '../domain/crypto_asset.dart';
import 'providers/crypto_asset_provider.dart';

class CryptoAssetTable extends HookConsumerWidget {
  const CryptoAssetTable({
    Key? key,
    required this.assets,
  }) : super(key: key);

  final List<CryptoAsset> assets;

  Widget buildPriceChange(CryptoAsset asset, TextStyle? contentStyle) {
    if (asset.changePercent24Hr == null) return const SizedBox.shrink();
    final color = asset.changePercent24Hr! >= 0 ? Colors.green : Colors.red;
    final changeAbs = asset.changePercent24Hr!.abs();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          asset.changePercent24Hr! >= 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          color: color,
          size: 24,
        ),
        Text(changeAbs.asPercentage, style: contentStyle?.copyWith(color: color)),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headerStyle = textTheme().titleSmall?.copyWith(color: blueGrey.shade500);
    final contentStyle = textTheme().titleSmall;
    return InteractiveViewer(
      scaleEnabled: false,
      constrained: false,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DataTable(
              columnSpacing: 24,
              columns: [
                DataColumn(label: Text('Name', style: headerStyle)),
                DataColumn(label: Text('Price', style: headerStyle)),
                DataColumn(label: Text('Price Change', style: headerStyle)),
                DataColumn(label: Text('Volume 24h', style: headerStyle)),
                DataColumn(label: Text('Market Cap', style: headerStyle)),
              ],
              rows: assets
                  .map((asset) => DataRow(
                        cells: [
                          DataCell(Row(
                            children: [
                              asset.logoSvg.toOption().match(
                                    () => const SizedBox(width: 32, height: 32),
                                    (svg) => SvgPicture.string(svg, height: 32, width: 32),
                                  ),
                              const SizedBox(width: 16),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(asset.name, style: contentStyle),
                                  Text(
                                    asset.symbol,
                                    style:
                                        textTheme().bodySmall?.copyWith(color: blueGrey.shade600),
                                  )
                                ],
                              ),
                            ],
                          )),
                          DataCell(Text(asset.priceUsd.asCurrency, style: contentStyle)),
                          DataCell(buildPriceChange(asset, contentStyle)),
                          DataCell(
                              Text(asset.volumeUsd24Hr.asCompactCurrency, style: contentStyle)),
                          DataCell(Text(asset.marketCapUsd.asCompactCurrency, style: contentStyle)),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class CryptoAssetList extends HookConsumerWidget {
  const CryptoAssetList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchAssetsProvider).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text(err.toString())),
          data: (data) => CryptoAssetTable(assets: data),
        );
  }
}
