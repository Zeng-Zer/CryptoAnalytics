// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../constants/data_exception.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/ref_extensions.dart';
import '../../data/crypto_repository.dart';
import '../../domain/crypto_asset.dart';
import '../../domain/crypto_asset_history.dart';
import '../../domain/crypto_binance_pair.dart';
import '../../domain/crypto_candle.dart';
import '../../domain/crypto_order.dart';
import '../../domain/crypto_symbol.dart';
import '../../domain/crypto_ticker.dart';
import '../../domain/crypto_trade.dart';
import '../crypto_screen.dart';

part 'crypto_asset_provider.g.dart';

// COINCAP API

@Riverpod(keepAlive: true)
Future<Map<String, CryptoSymbol>> fetchIdSymbolsMap(FetchIdSymbolsMapRef ref) async {
  print('fetchIdSymbolsMap');
  const limit = 800;
  var offset = 0;
  final result = <String, CryptoSymbol>{};
  do {
    result.addAll(await ref
        .read(cryptoRepositoryProvider)
        .fetchIdSymbolsMap(limit: limit, offset: offset)
        .unwrap());
    offset += limit;
  } while (result.length % limit == 0);

  print('fetchIdSymbolsMap ${result.length}');

  result.addAll(await ref.read(cryptoRepositoryProvider).fetchIdRatesMap().unwrap());

  print('fetchIdSymbolsMap done ${result.length}');
  return result;
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
  final assetIdx = assets.indexWhere((asset) => asset.id == assetId);
  if (assetIdx == -1) {
    return await ref.read(cryptoRepositoryProvider).fetchAsset(assetId).unwrap();
  }

  return assets[assetIdx];
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

@Riverpod(keepAlive: true)
Future<Set<String>> fetchExchangesSocket(FetchExchangesSocketRef ref) async {
  return await ref.read(cryptoRepositoryProvider).fetchExchangesSocket().unwrap();
}

@riverpod
Stream<List<CryptoTrade>> cryptoTrade(CryptoTradeRef ref,
    {String exchange = 'binance', required String assetId}) async* {
  print('fetch crypto trade $exchange $assetId');
  final idSymbolsMap = await ref.watch(fetchIdSymbolsMapProvider.future);
  final exchanges = await ref.watch(fetchExchangesSocketProvider.future);

  final channels = exchanges
      .map((exchange) =>
          WebSocketChannel.connect(Uri.parse('${CryptoRepository.coinCapTradeWs}/$exchange')))
      .toList();

  ref.onDispose(() => channels.forEach((channel) => channel.sink.close()));

  var trades = <CryptoTrade>[];
  final mergedChannels = StreamGroup.merge(channels.map((channel) => channel.stream));
  try {
    await for (final message in mergedChannels) {
      final json = jsonDecode(message as String) as Map<String, dynamic>;
      final trade = CryptoTrade.fromJson(json);
      if (trade.base == assetId &&
          (trades.isEmpty ||
              trades.first.timestamp.millisecondsSinceEpoch <
                  trade.timestamp.millisecondsSinceEpoch)) {
        trades = [
          trade.copyWith(
            baseSymbol: idSymbolsMap[trade.base]?.symbol ?? trade.base,
            baseName: idSymbolsMap[trade.base]?.name ?? trade.base,
            quoteName: idSymbolsMap[trade.quote]?.name ?? trade.quote,
            quoteSymbol: idSymbolsMap[trade.quote]?.symbol ?? trade.quote,
          ),
          ...trades
        ];
        yield trades;
        print('yielded');
      }
    }
    print('yielded scope done');
  } catch (e, s) {
    print('error $e, $s');
    ref.invalidateSelf();
  }
}

@riverpod
Future<String?> fetchLogo(FetchLogoRef ref, String symbol) async {
  print('fetch asset logo $symbol');
  ref.keepAlive();
  return ref.read(cryptoRepositoryProvider).fetchAssetLogo(symbol).unwrap();
}

// BINANCE API
@Riverpod(keepAlive: true)
Future<List<CryptoBinancePair>> fetchBinancePairs(FetchBinancePairsRef ref) async {
  print('fetch binance pairs');
  final pairs = await ref.read(cryptoRepositoryProvider).fetchBinancePairs().unwrap();
  return pairs;
}

@riverpod
Future<List<CryptoBinancePair>> fetchBinancePairsByBaseSymbol(
  FetchBinancePairsByBaseSymbolRef ref,
  String baseSymbol,
) async {
  print('fetch binance pairs by base symbol $baseSymbol');
  final allPairs = await ref.watch(fetchBinancePairsProvider.future);
  final pairs = allPairs.where((pair) => pair.baseAsset == baseSymbol).toList();
  final updatedPairs = await Future.wait(
    pairs.map((pair) => ref
        .read(cryptoRepositoryProvider)
        .fetchBinanceSymbolPrice(pair.symbol)
        .unwrap()
        .then((price) => pair.copyWith(priceQuote: price))),
  );
  ref.refreshAfter(const Duration(seconds: 2));
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

@riverpod
class CryptoExpandPairs extends _$CryptoExpandPairs {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }

  void collapse() {
    state = false;
  }
}

// HELPERS

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
