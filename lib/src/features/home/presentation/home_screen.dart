import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'crypto_asset_graph.dart';
import 'crypto_asset_list.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: const [
              CryptoAssetGraph(),
              Expanded(child: CryptoAssetList()),
            ],
          ),
        ),
      ),
    );
  }
}
