import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/data_exception.dart';
import '../../data/crypto_repository.dart';
import '../../domain/crypto_asset.dart';

part 'crypto_asset_provider.g.dart';

@riverpod
Future<String> fetchLogo(FetchLogoRef ref, String symbol) async {
  final cryptoRepo = ref.read(cryptoRepositoryProvider);
  final Future<String> response = (await cryptoRepo.fetchAssetLogo(symbol).run()).match(
    (l) {
      print('${l.message}\n${l.stackTrace}');
      return Future.error(l.message, l.stackTrace);
    },
    (r) async => r,
  );

  ref.keepAlive();
  return response;
}

@riverpod
Future<List<CryptoAsset>> fetchAssets(FetchAssetsRef ref) async {
  Timer(const Duration(seconds: 10), () {
    ref.invalidateSelf();
  });

// ignore: avoid_manual_providers_as_generated_provider_dependency
  final cryptoRepo = ref.read(cryptoRepositoryProvider);
  print('fetchAssets');
  final value = cryptoRepo.fetchAssets().flatMap((assets) => assets.map((asset) {
        final task2 = TaskOption.tryCatch(() async {
          final logo = await ref.watch(fetchLogoProvider(asset.symbol).future);
          return asset.copyWith(logoSvg: logo);
        });

        return TaskEither<DataException, CryptoAsset>.fromTask(task2.getOrElse(() => asset));
      }).sequenceTaskEither());

  return (await value.run()).match(
    (l) {
      print('${l.message}\n${l.stackTrace}');
      return Future.error(l.message, l.stackTrace);
    },
    (r) => r,
  );
}
