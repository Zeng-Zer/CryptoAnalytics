// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/data_exception.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/ref_extensions.dart';
import '../../data/crypto_repository.dart';
import '../../domain/crypto_asset.dart';
import '../../domain/crypto_asset_history.dart';
import '../../domain/crypto_binance_pair.dart';
import '../../domain/crypto_candle.dart';
import '../../domain/crypto_order.dart';
import '../../domain/crypto_ticker.dart';
import '../crypto_screen.dart';

part 'crypto_asset_provider.g.dart';

// COINCAP API

@riverpod
Future<String?> fetchLogo(FetchLogoRef ref, String symbol) async {
  print('fetch asset logo $symbol');
  ref.keepAlive();
  return ref.read(cryptoRepositoryProvider).fetchAssetLogo(symbol).unwrap();
}

@riverpod
Future<List<CryptoAsset>> fetchAssets(FetchAssetsRef ref) async {
  print('fetchAssets');

  ref.refreshAfter(const Duration(seconds: 10));

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
}

@riverpod
Future<List<CryptoAssetHistory>> fetchAssetHistory(FetchAssetHistoryRef ref,
    {required String assetId, bool refresh = false}) async {
  print('fetch Assets History');

  final history = await ref.read(cryptoRepositoryProvider).fetchAssetHistory(assetId).unwrap();

  if (refresh) {
    ref.refreshAfter(const Duration(seconds: 55));
  }

  return history;
}

// BINANCE API
@riverpod
Future<List<CryptoBinancePair>> fetchBinancePairs(FetchBinancePairsRef ref) async {
  print('fetch binance pairs');
  final pairs = await ref.read(cryptoRepositoryProvider).fetchBinancePairs().unwrap();
  ref.keepAlive();
  return pairs;
}

@riverpod
Future<List<CryptoBinancePair>> fetchBinancePairsByBaseSymbol(
  FetchBinancePairsByBaseSymbolRef ref,
  String baseSymbol,
) async {
  final allPairs = await ref.watch(fetchBinancePairsProvider.future);
  final pairs = allPairs.where((pair) => pair.baseAsset == baseSymbol).toList();
  final updatedPairs = await Future.wait(
    pairs.map((pair) => ref
        .read(cryptoRepositoryProvider)
        .fetchBinanceSymbolPrice(pair.symbol)
        .unwrap()
        .then((price) => pair.copyWith(priceQuote: price))),
  );
  return updatedPairs;
}

@riverpod
Future<CryptoTicker> fetchTicker(FetchTickerRef ref, String symbol) async {
  print('fetch binance ticker');
  final ticker = ref.read(cryptoRepositoryProvider).fetchBinanceTicker24h(symbol).unwrap();
  ref.refreshAfter(const Duration(seconds: 1));
  return ticker;
}

@riverpod
Future<List<CryptoCandle>> fetchCandles(
  FetchCandlesRef ref, {
  required String symbol,
  String interval = '1m',
}) async {
  print('fetch candles');
  ref.refreshAfter(const Duration(seconds: 55));
  return ref
      .read(cryptoRepositoryProvider)
      .fetchCandles(symbol: symbol, interval: interval)
      .unwrap();
}

@riverpod
Future<CryptoOrder> fetchOrderBook(FetchOrderBookRef ref, String symbol) async {
  print('fetch order book for $symbol');
  final orderBook = await ref.read(cryptoRepositoryProvider).fetchOrderBook(symbol).unwrap();
  ref.refreshAfter(const Duration(seconds: 1));
  return orderBook;
}

@riverpod
class CryptoPairSelection extends _$CryptoPairSelection {
  @override
  CryptoBinancePair? build(String symbol) {
    return ref
        .watch(fetchBinancePairsByBaseSymbolProvider(symbol))
        .whenOrNull(data: (pairs) => pairs.first);
  }

  void select(CryptoBinancePair pair) {
    state = pair;
  }
}

@riverpod
class CryptoPriceOrCandleSelection extends _$CryptoPriceOrCandleSelection {
  @override
  PriceCandleState build() {
    return PriceCandleState.price;
  }

  PriceCandleState toggle() {
    state = state == PriceCandleState.price ? PriceCandleState.candle : PriceCandleState.price;
    return state;
  }
}

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
