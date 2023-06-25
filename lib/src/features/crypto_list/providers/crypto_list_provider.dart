// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data_exception.dart';
import '../../../repositories/crypto_repository.dart';
import '../../../utils/extensions.dart';
import '../../../utils/ref_extensions.dart';
import '../../crypto_info/providers/crypto_favorite_provider.dart';
import '../../crypto_list/domain/crypto_asset.dart';
import '../../crypto_list/domain/crypto_identifier.dart';

part 'crypto_list_provider.g.dart';

// COINCAP API

@Riverpod(keepAlive: true)
Future<List<CryptoIdentifier>> fetchCryptoIdentifiers(FetchCryptoIdentifiersRef ref) async {
  print('fetchCryptoIdentifiers');
  const limit = 800;

  var offset = 0;
  final result = <CryptoIdentifier>[];
  do {
    result.addAll(await ref
        .read(cryptoRepositoryProvider)
        .fetchCryptoIdentifiers(limit: limit, offset: offset)
        .unwrap());
    offset += limit;
  } while (result.length % limit == 0);

  print('fetchCryptoIdentifiers done ${result.length}');
  return result;
}

@riverpod
Future<List<CryptoAsset>> searchAssets(
  SearchAssetsRef ref, {
  String? search,
  bool favoriteOnly = false,
  int limit = 100,
  int offset = 0,
}) async {
  searchIds() async {
    if (!favoriteOnly && (search == null || search.isEmpty)) {
      return null;
    }
    final favorites = await ref.watch(favoritesProvider.future);
    // filter favorites ids
    final identifiers = (await ref.watch(fetchCryptoIdentifiersProvider.future))
        .where((identifier) => !favoriteOnly || favorites.contains(identifier.symbol));

    if (search == null || search.isEmpty) {
      return identifiers.map((identifier) => identifier.id).toSet();
    }

    return identifiers
        .where((identifier) =>
            identifier.symbol.toLowerCase().startsWith(search.toLowerCase()) ||
            identifier.name?.toLowerCase().startsWith(search.toLowerCase()) == true)
        .map((identifier) => identifier.id)
        .toSet();
  }

  final result = await ref
      .read(cryptoRepositoryProvider)
      .fetchAssets(ids: await searchIds(), limit: limit, offset: offset)
      .flatMap((assets) => _addAssetLogos(ref, assets))
      .unwrap();

  const duration = Duration(seconds: 10);
  ref.cacheFor(duration);
  ref.refreshAfter(duration);

  return result;
}

@riverpod
Future<String?> fetchLogo(FetchLogoRef ref, String symbol) async {
  print('fetch asset logo $symbol');
  ref.keepAlive();
  return ref.read(cryptoRepositoryProvider).fetchAssetLogo(symbol).unwrap();
}

// HELPERS

TaskEither<DataException, List<CryptoAsset>> _addAssetLogos(
    AutoDisposeRef ref, List<CryptoAsset> assets) {
  return assets
      .map(
        (asset) => TaskEither<DataException, CryptoAsset>.fromTask(
          TaskOption.tryCatch(
            () async =>
                asset.copyWith(logoSvg: await ref.watch(fetchLogoProvider(asset.symbol).future)),
          ).getOrElse(() => asset),
        ),
      )
      .sequenceTaskEither();
}
