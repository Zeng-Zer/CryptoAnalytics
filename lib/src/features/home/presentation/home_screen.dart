import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/z_search_bar.dart';
import '../../../constants.dart';
import '../domain/crypto_asset.dart';
import 'crypto_asset_list.dart';
import 'providers/crypto_asset_provider.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  // filter name and symbol based on search
  List<CryptoAsset> filterCryptoAssetList(List<CryptoAsset> assets, String search) {
    return assets
        .where((asset) =>
            asset.name.toLowerCase().startsWith(search.toLowerCase()) ||
            asset.symbol.toLowerCase().startsWith(search.toLowerCase()))
        .toList();
  }

  Widget buildCryptoAssetList(WidgetRef ref, {String? search}) {
    return ref.watch(fetchAssetsProvider).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text(err.toString())),
          data: (data) {
            if (search != null) {
              data = filterCryptoAssetList(data, search);
            }
            return CryptoAssetList(assets: data);
          },
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();

    useListenable(controller);

    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: sideMargin.copyWith(top: 8),
                child: ZSearchBar(
                  hint: 'Search tokens',
                  focusNode: focusNode,
                  controller: controller,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(child: buildCryptoAssetList(ref, search: controller.text)),
            ],
          ),
        ),
      ),
    );
  }
}
