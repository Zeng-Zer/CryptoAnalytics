import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/crypto_repository.dart';
import '../domain/crypto_asset.dart';

part 'home_screen.g.dart';

@riverpod
Future<List<CryptoAsset>> fetchAssets(FetchAssetsRef ref) async {
  final cryptoRepo = ref.read(cryptoRepositoryProvider);
  return (await cryptoRepo.fetchAssets().run()).match(
    (l) => Future.error(l.message, l.stackTrace),
    (r) => r,
  );
}

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final assets = ref.watch(fetchAssetsProvider);
          return assets.when(
            loading: () {
              if (index != 0) return null;
              return const CircularProgressIndicator();
            },
            error: (err, stack) {
              print('$err\n$stack');
              return Text(err.toString());
            },
            data: (data) {
              if (index >= data.length) return null;
              return Text(data[index].name);
            },
          );
          // CryptoRepository().test();
          // return const Text('hell');
        },
      ),
    );
  }
}
