import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/padded_container.dart';
import '../../../components/svg_logo_string.dart';
import '../../../constants.dart';
import '../../../routing/app_router.dart';
import '../../../theme.dart';
import '../../../utils/extensions.dart';
import '../domain/crypto_asset.dart';
import 'crypto_price_change.dart';
import 'providers/crypto_asset_provider.dart';

final previousSearchProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

class CryptoAssetList extends HookConsumerWidget {
  const CryptoAssetList({
    Key? key,
    required this.search,
  }) : super(key: key);

  final String search;
  final nameWidth = 170.0;
  final priceWidth = 110.0;
  final priceChangeWidth = 110.0;
  final volumeWidth = 110.0;
  final marketCapWidth = 90.0;

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
            SvgLogoString(logo: asset.logoSvg, size: 32),
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
          child: CryptoPriceChange(
            change: asset.changePercent24Hr ?? 0.0,
            style: contentStyle,
            iconUp: Icons.arrow_drop_up,
            iconDown: Icons.arrow_drop_down,
          ),
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

  Widget buildListView(WidgetRef ref) {
    final scrollController = useScrollController();
    final lastDirection = useState(ScrollDirection.idle);
    // Set idle to prevent loading indicator from showing on all indexes if we just scrolled up
    ref.listen(previousSearchProvider, (previous, next) {
      if (previous != next) {
        Future(() => lastDirection.value = ScrollDirection.idle);
      }
    });
    // Set scroll direction
    scrollController.addListener(() {
      final direction = scrollController.position.userScrollDirection;
      print(direction);
      lastDirection.value = direction;
    });

    final contentStyle = textTheme().titleSmall;
    const limit = 50;
    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        final page = index ~/ limit;
        final pageIndex = index % limit;
        final assets =
            ref.watch(searchAssetsProvider(search: search, limit: limit, offset: page * limit));
        return assets.when(
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () {
            switch ((lastDirection.value, pageIndex)) {
              case (!= ScrollDirection.forward, == 0) || (ScrollDirection.forward, _):
                return const Center(child: CircularProgressIndicator());
              case _:
                return null;
            }
          },
          data: (assets) {
            if (pageIndex >= assets.length) return null;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (index > 0) const Divider(),
                buildRow(context, assets[pageIndex], contentStyle),
              ],
            );
          },
        );
        // return buildRow(context, assets[index], contentStyle);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future(() {
      if (ref.watch(previousSearchProvider) != search) {
        ref.read(previousSearchProvider.notifier).state = search;
      }
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: PaddedContainer(
        margin: sideMargin,
        child: SizedBox(
          width: nameWidth + priceWidth + priceChangeWidth + volumeWidth + marketCapWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildHeader(),
              const Divider(),
              Expanded(
                child: buildListView(ref),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
