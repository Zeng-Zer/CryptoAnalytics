// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/data_exception.dart';
import '../../../../utils/extensions.dart';
import '../../data/crypto_repository.dart';
import '../../domain/crypto_asset.dart';
import '../../domain/crypto_asset_history.dart';

part 'crypto_asset_provider.g.dart';

@riverpod
Future<String> fetchLogo(FetchLogoRef ref, String symbol) async {
  print('fetch asset logo $symbol');
  ref.keepAlive();
  return ref.read(cryptoRepositoryProvider).fetchAssetLogo(symbol).unwrap();
}

@riverpod
Future<List<CryptoAsset>> fetchAssets(FetchAssetsRef ref) async {
  print('fetchAssets');

  // refresh every 10 sec
  Timer(const Duration(seconds: 10), () {
    ref.invalidateSelf();
  });

  return ref
      .read(cryptoRepositoryProvider)
      .fetchAssets()
      // Add logo to assets
      .flatMap(
        (assets) => assets
            .map((asset) =>
                _addAssetLogo(asset, () => ref.watch(fetchLogoProvider(asset.symbol).future)))
            .sequenceTaskEither(),
      )
      .unwrap();
}

@riverpod
Future<CryptoAsset> fetchAsset(FetchAssetRef ref, String assetId) async {
  print('fetch assets $assetId');
  final assets = await ref.watch(fetchAssetsProvider.future);
  return assets.firstWhere((asset) => asset.id == assetId);
  // return ref
  //     .read(cryptoRepositoryProvider)
  //     .fetchAsset(assetId)
  //     // Add logo to asset
  //     .flatMap(
  //       (asset) => _addAssetLogo(asset, () => ref.watch(fetchLogoProvider(asset.symbol).future)),
  //     )
  //     .unwrap();
}

@riverpod
Future<List<CryptoAssetHistory>> fetchAssetHistory(FetchAssetHistoryRef ref,
    {required String assetId, bool refresh = false}) async {
  print('fetch Assets History');

  if (refresh) {
    Timer(const Duration(seconds: 5), () {
      ref.invalidateSelf();
    });
  }

  return ref.read(cryptoRepositoryProvider).fetchAssetHistory(assetId).unwrap();
}

// @riverpod
// Future<CryptoAssetDetail> fetchAssetDetail(FetchAssetDetailRef ref, String assetId) async {
//   print('fetch Assets Detail');
//   ref.invalidate(fetchAssetHistoryProvider(assetId));
//   final history = await ref.read(fetchAssetHistoryProvider(assetId).future);
//   final assets = await ref.watch(fetchAssetsProvider.future);
//   final asset = assets.firstWhere((asset) => asset.id == assetId);
//   return CryptoAssetDetail(
//     asset: asset,
//     history: history,
//   );
// }

TaskEither<DataException, CryptoAsset> _addAssetLogo(
    CryptoAsset asset, Future<String?> Function() fetchLogo) {
  final assetWithLogo = TaskOption.tryCatch(() async {
    final logo = await fetchLogo();
    return asset.copyWith(logoSvg: logo);
  });

  return TaskEither<DataException, CryptoAsset>.fromTask(
    assetWithLogo.getOrElse(() => asset),
  );
}
