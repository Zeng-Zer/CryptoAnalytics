import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/data_exception.dart';
import '../domain/crypto_asset.dart';
import '../domain/crypto_asset_history.dart';

// Wrap dio response, deserialize json and return a TaskEither
extension CoinCapApi on Future<Response> {
  TaskEither<DataException, R> wrap<R, T>(R Function(T) parseJson) => TaskEither.tryCatch(
        () => then((value) => parseJson(value.data['data'])),
        (err, stackTrace) => DataException(message: err.toString(), stackTrace: stackTrace),
      );
}

extension SimpleSwapApi on Future<Response> {
  TaskEither<DataException, T> rawData<T>() => TaskEither.tryCatch(
        () => then((value) => value.data),
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

  String coinCapBaseUrl = 'https://api.coincap.io/v2';
  String assetsUrl = '/assets';

  TaskEither<DataException, List<CryptoAsset>> fetchAssets() {
    return _dio
        .get(coinCapBaseUrl + assetsUrl) //
        .wrap<List<CryptoAsset>, List>(
          (assets) => assets.map((json) => CryptoAsset.fromJson(json)).toList(),
        );
  }

  TaskEither<DataException, CryptoAsset> fetchAsset(String assetId) {
    return _dio
        .get('$coinCapBaseUrl$assetsUrl/$assetId')
        .wrap<CryptoAsset, dynamic>((json) => CryptoAsset.fromJson(json));
  }

  TaskEither<DataException, List<CryptoAssetHistory>> fetchAssetHistory(String assetId) {
    return _dio.get('$coinCapBaseUrl$assetsUrl/$assetId/history', queryParameters: {
      'interval': 'm1',
      // 'start': DateTime.now().subtract(const Duration(days: 1)).millisecondsSinceEpoch,
      // 'end': DateTime.now().millisecondsSinceEpoch,
    }).wrap<List<CryptoAssetHistory>, List>(
      (assets) => assets.map((json) => CryptoAssetHistory.fromJson(json)).toList(),
    );
  }

  TaskEither<DataException, String> fetchAssetLogo(String symbol) {
    return _dio
        .get('https://static.simpleswap.io/images/currencies-logo/${symbol.toLowerCase()}.svg')
        .rawData<String>();
  }
}

final cryptoRepositoryProvider = Provider<CryptoRepository>((ref) {
  return CryptoRepository();
});
