import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/z_search_bar.dart';
import '../../../constants.dart';
import 'crypto_asset_list.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

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
              Expanded(child: CryptoAssetList(search: controller.text)),
            ],
          ),
        ),
      ),
    );
  }
}
