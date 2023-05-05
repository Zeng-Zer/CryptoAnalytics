import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/crypto_asset.dart';
import 'crypto_asset_graph.dart';

@RoutePage()
class CryptoScreen extends HookConsumerWidget {
  const CryptoScreen({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final CryptoAsset asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(asset.name),
      ),
      body: CryptoAssetGraph(assetId: asset.id),
    );
  }
}
