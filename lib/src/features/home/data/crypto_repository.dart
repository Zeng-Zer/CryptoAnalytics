import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/data_exception.dart';
import '../domain/crypto_asset.dart';
import '../domain/crypto_asset_history.dart';
import '../domain/crypto_binance_pair.dart';
import '../domain/crypto_candle.dart';
import '../domain/crypto_order.dart';

// Wrap dio response, deserialize json and return a TaskEither
extension CoinCapApi on Future<Response> {
  TaskEither<DataException, R> wrapCoinCap<R, T>(R Function(T) parseJson) => TaskEither.tryCatch(
        () => then((value) => parseJson(value.data['data'])),
        (err, stackTrace) => DataException.fromDioError(err as DioError, stackTrace),
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
  String coinCapBaseUrl = 'https://api.coincap.io/v2';
  String assetsUrl = '/assets';
  String marketsUrl = '/markets';

  TaskEither<DataException, List<CryptoAsset>> fetchAssets() {
    return _dio
        .get(coinCapBaseUrl + assetsUrl) //
        .wrapCoinCap<List<CryptoAsset>, List>(
          (assets) => assets.map((json) => CryptoAsset.fromJson(json)).toList(),
        );
  }

  TaskEither<DataException, CryptoAsset> fetchAsset(String assetId) {
    return _dio
        .get('$coinCapBaseUrl$assetsUrl/$assetId')
        .wrapCoinCap<CryptoAsset, dynamic>((json) => CryptoAsset.fromJson(json));
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
  String binanceBaseUrl = 'https://api.binance.com/api/v3';
  String exchangeInfoUrl = '/exchangeInfo';
  String priceTickerUrl = '/ticker/price';
  String klinesUrl = '/klines';
  String orderBookUrl = '/depth';

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
      'limit': 20,
    }).wrap<CryptoOrder>(parseJson: (json) => CryptoOrder.fromJson(json));
  }
}

final cryptoRepositoryProvider = Provider<CryptoRepository>((ref) {
  return CryptoRepository();
});
