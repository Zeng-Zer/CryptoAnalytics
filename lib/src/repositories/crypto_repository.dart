import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data_exception.dart';
import '../features/crypto_info/domain/crypto_asset_history.dart';
import '../features/crypto_info/domain/crypto_binance_pair.dart';
import '../features/crypto_info/domain/crypto_candle.dart';
import '../features/crypto_info/domain/crypto_order.dart';
import '../features/crypto_info/domain/crypto_ticker.dart';
import '../features/crypto_list/domain/crypto_asset.dart';
import '../features/crypto_list/domain/crypto_identifier.dart';

// Wrap dio response, deserialize json and return a TaskEither
extension CoinCapApi on Future<Response> {
  TaskEither<DataException, R> wrapCoinCap<R, T>(R Function(T) parseJson) => TaskEither.tryCatch(
        () => then((value) => parseJson(value.data['data'])),
        (err, stackTrace) {
          switch (err.runtimeType) {
            case DioError:
              return DataException.fromDioError(err as DioError, stackTrace);
            default:
              return DataException(message: err.toString(), stackTrace: stackTrace);
          }
        },
      );
}

extension Api on Future<Response> {
  TaskEither<DataException, R> wrap<R>({R Function(dynamic)? parseJson}) => TaskEither.tryCatch(
        () => then((value) => (parseJson == null) ? value.data : parseJson(value.data)),
        (err, stackTrace) => DataException(message: err.toString(), stackTrace: stackTrace),
      );
}

class CryptoRepository {
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    ),
  );

  // COINCAP API
  static const String coinCapBaseUrl = 'https://api.coincap.io/v2';
  static const String assetsUrl = '/assets';
  static const String marketsUrl = '/markets';
  static const String exchangesUrl = '/exchanges';
  static const String ratesUrl = '/rates';
  static const String coinCapTradeWs = 'wss://ws.coincap.io/trades';

  TaskEither<DataException, List<CryptoAsset>> fetchAssets(
      {Set<String>? ids, required int limit, required int offset}) {
    if (ids != null && ids.isEmpty) return TaskEither.right([]);
    return _dio.get(coinCapBaseUrl + assetsUrl, queryParameters: {
      if (ids != null) 'ids': ids.join(','),
      'limit': limit,
      'offset': offset,
    }).wrapCoinCap<List<CryptoAsset>, List>(
      (assets) => assets.map((json) => CryptoAsset.fromJson(json)).toList(),
    );
  }

  TaskEither<DataException, List<CryptoIdentifier>> fetchCryptoIdentifiers(
      {int limit = 100, int offset = 0}) {
    return _dio.get(coinCapBaseUrl + assetsUrl, queryParameters: {
      'limit': limit,
      'offset': offset
    }).wrapCoinCap<List<CryptoIdentifier>, List>(
      (assets) => assets.map((json) => CryptoIdentifier.fromJson(json)).toList(),
    );
  }

  TaskEither<DataException, List<CryptoIdentifier>> fetchCryptoRateIdentifiers() {
    return _dio.get(coinCapBaseUrl + ratesUrl).wrapCoinCap<List<CryptoIdentifier>, List>(
          (assets) => assets
              .map(
                (json) => CryptoIdentifier.fromJson(json),
              )
              .toList(),
        );
  }

  TaskEither<DataException, CryptoAsset> fetchAsset(String assetId) {
    return _dio
        .get('$coinCapBaseUrl$assetsUrl/$assetId')
        .wrapCoinCap<CryptoAsset, dynamic>((json) => CryptoAsset.fromJson(json));
  }

  TaskEither<DataException, Set<String>> fetchExchangesSocket() {
    return _dio.get('$coinCapBaseUrl$exchangesUrl').wrapCoinCap<Set<String>, List>((json) => json
        .map((e) => (e['socket'] as bool?) == true ? e['exchangeId'] as String : null)
        .whereType<String>()
        .toSet());
  }

  TaskEither<DataException, List<CryptoAssetHistory>> fetchAssetHistory(String assetId) {
    return _dio.get('$coinCapBaseUrl$assetsUrl/$assetId/history', queryParameters: {
      'interval': 'm1',
    }).wrapCoinCap<List<CryptoAssetHistory>, List>(
      (assets) => assets.map((json) => CryptoAssetHistory.fromJson(json)).toList(),
    );
  }

  TaskEither<DataException, String?> fetchAssetLogo(String symbol) {
    return _dio
        .get('https://static.simpleswap.io/images/currencies-logo/${symbol.toLowerCase()}.svg')
        .onError(
          (err, __) => Response<String?>(data: null, requestOptions: RequestOptions()),
          test: (e) =>
              e is DioError && e.type == DioErrorType.badResponse && e.response!.statusCode == 404,
        )
        .wrap<String?>();
  }

  // BINANCE API
  static const String binanceBaseUrl = 'https://api.binance.com/api/v3';
  static const String exchangeInfoUrl = '/exchangeInfo';
  static const String priceTickerUrl = '/ticker/price';
  static const String ticker24hrUrl = '/ticker/24hr';
  static const String klinesUrl = '/klines';
  static const String orderBookUrl = '/depth';

  TaskEither<DataException, List<CryptoBinancePair>> fetchBinancePairs() {
    return TaskEither.tryCatch(
      () => _dio.get(binanceBaseUrl + exchangeInfoUrl).then((value) =>
          (value.data['symbols'] as List)
              .map((symbol) => CryptoBinancePair.fromJson(symbol))
              .toList()),
      (err, stackTrace) => DataException.fromDioError(err as DioError, stackTrace),
    );
  }

  TaskEither<DataException, double> fetchBinanceSymbolPrice(String symbol) {
    return _dio.get(binanceBaseUrl + priceTickerUrl, queryParameters: {'symbol': symbol}).wrap(
      parseJson: (json) => double.parse(json['price']),
    );
  }

  TaskEither<DataException, CryptoTicker> fetchBinanceTicker24h(String symbol) {
    return _dio.get(binanceBaseUrl + ticker24hrUrl, queryParameters: {'symbol': symbol}).wrap(
      parseJson: (json) => CryptoTicker.fromJson(json),
    );
  }

  TaskEither<DataException, List<CryptoCandle>> fetchCandles({
    required String symbol,
    required String interval,
  }) {
    return _dio.get(binanceBaseUrl + klinesUrl, queryParameters: {
      'symbol': symbol,
      'interval': interval,
      'limit': 1000,
    }).wrap<List<CryptoCandle>>(parseJson: (json) {
      final list = json as List<dynamic>;
      return list.map((candle) => CryptoCandle.fromList(candle as List<dynamic>)).toList();
    });
  }

  TaskEither<DataException, CryptoOrder> fetchOrderBook(String symbol) {
    return _dio.get(binanceBaseUrl + orderBookUrl, queryParameters: {
      'symbol': symbol,
      'limit': 40,
    }).wrap<CryptoOrder>(parseJson: (json) => CryptoOrder.fromJson(json));
  }
}

final cryptoRepositoryProvider = Provider<CryptoRepository>((ref) {
  return CryptoRepository();
});
