// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../data_exception.dart';
import '../../../repositories/crypto_repository.dart';
import '../../../utils/extensions.dart';
import '../../../utils/ref_extensions.dart';
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

@Riverpod(keepAlive: true)
Future<List<CryptoIdentifier>> fetchCryptoRateIdentifiers(FetchCryptoRateIdentifiersRef ref) async {
  return ref.read(cryptoRepositoryProvider).fetchCryptoRateIdentifiers().unwrap();
}

@Riverpod(keepAlive: true)
Future<Map<String, CryptoIdentifier>> fetchIdSymbolsMap(FetchIdSymbolsMapRef ref) async {
  return {
    ...{for (var e in await ref.watch(fetchCryptoIdentifiersProvider.future)) e.id: e},
    ...{for (var e in await ref.watch(fetchCryptoRateIdentifiersProvider.future)) e.id: e},
  };
}

@riverpod
Future<List<CryptoAsset>> searchAssets(
  SearchAssetsRef ref, {
  String? search,
  int limit = 100,
  int offset = 0,
}) async {
  // print('searchAssets $search');
  searchId() async {
    if (search == null || search.isEmpty) return null;
    return (await ref.watch(fetchCryptoIdentifiersProvider.future))
        .where((identifier) =>
            identifier.symbol.toLowerCase().startsWith(search.toLowerCase()) ||
            identifier.name?.toLowerCase().startsWith(search.toLowerCase()) == true)
        .map((identifier) => identifier.id)
        .toSet();
  }

  final result = await ref
      .read(cryptoRepositoryProvider)
      .fetchAssets(ids: await searchId(), limit: limit, offset: offset)
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
