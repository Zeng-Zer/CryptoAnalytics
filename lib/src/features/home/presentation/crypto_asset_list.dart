import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/app_router.dart';
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
  final nameWidth = 170.0;
  final priceWidth = 110.0;
  final priceChangeWidth = 110.0;
  final volumeWidth = 110.0;
  final marketCapWidth = 90.0;

  Widget buildPriceChange(double? change, TextStyle? contentStyle) {
    if (change == null) return const SizedBox.shrink();
    final color = change >= 0 ? Colors.green : Colors.red;
    final changeAbs = change.abs();
    return Row(
      children: [
        Icon(
          change >= 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          color: color,
          size: 24,
        ),
        Text(changeAbs.asPercentage, style: contentStyle?.copyWith(color: color)),
      ],
    );
  }

  Widget buildHeader() {
    final headerStyle = textTheme().titleSmall?.copyWith(color: blueGrey.shade500);

    buildHeaderCol(String colName, double width) => Container(
          width: width,
          padding: const EdgeInsets.all(4),
          child: Text(colName, style: headerStyle),
        );

    return Row(
      children: [
        buildHeaderCol('Name', nameWidth),
        buildHeaderCol('Price', priceWidth),
        buildHeaderCol('Price Change', priceChangeWidth),
        buildHeaderCol('Volume 24h', volumeWidth),
        buildHeaderCol('Market Cap', marketCapWidth),
      ],
    );
  }

  Widget buildRow(BuildContext context, CryptoAsset asset, TextStyle? contentStyle) {
    final nameRow = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.pushRoute(CryptoRoute(asset: asset)),
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            asset.logoSvg.toOption().match(
                  () => const SizedBox(width: 32, height: 32),
                  (svg) => SvgPicture.string(svg, height: 32, width: 32),
                ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.name,
                    style: contentStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    asset.symbol,
                    style: textTheme().bodySmall?.copyWith(color: blueGrey.shade600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 16),
          width: nameWidth,
          child: nameRow,
        ),
        SizedBox(
          width: priceWidth,
          child: Text(asset.priceUsd.asCryptoCurrency, style: contentStyle),
        ),
        SizedBox(
          width: priceChangeWidth,
          child: buildPriceChange(asset.changePercent24Hr, contentStyle),
        ),
        SizedBox(
          width: volumeWidth,
          child: Text(asset.volumeUsd24Hr.asCompactCurrency, style: contentStyle),
        ),
        SizedBox(
          width: marketCapWidth,
          child: Text(asset.marketCapUsd.asCompactCurrency, style: contentStyle),
        ),
      ],
    );
  }

  Widget buildTable(List<CryptoAsset> assets) {
    final contentStyle = textTheme().titleSmall;
    return SizedBox(
      width: nameWidth + priceWidth + priceChangeWidth + volumeWidth + marketCapWidth,
      child: Column(
        children: [
          buildHeader(),
          const Divider(),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              scrollDirection: Axis.vertical,
              itemCount: assets.length,
              itemBuilder: (context, index) => buildRow(context, assets[index], contentStyle),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: buildTable(assets),
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
