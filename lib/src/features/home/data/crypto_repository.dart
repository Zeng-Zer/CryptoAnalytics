import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/data_exception.dart';
import '../domain/crypto_asset.dart';
import '../domain/crypto_pair.dart';

// Convert the Dio response to a TaskEither and return the data for CoinCap api
extension CoinCapApi on Future<Response> {
  TaskEither<DataException, T> toData<T>() => TaskEither.tryCatch(
        () => then((value) => value.data['data']),
        (err, _) => DataException(message: err.toString()),
      );
}

class CryptoRepository {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.coincap.io/v2',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    ),
  );
  String assetsUrl = '/assets';
  String marketsUrl = '/markets';

  TaskEither<DataException, List<CryptoPair>> fetchMarkets({String exchangeId = 'binance'}) {
    return _dio
        .get(marketsUrl, queryParameters: {
          'exchangeId': exchangeId,
        })
        .toData<List>()
        .map((pairs) => pairs.map((json) => CryptoPair.fromJson(json)).toList());
  }

  TaskEither<DataException, List<CryptoAsset>> fetchAssets() {
    return _dio.get(assetsUrl).toData<List>().flatMap(
          (assets) => TaskEither.tryCatch(
            () async => assets.map((json) => CryptoAsset.fromJson(json)).toList(),
            (o, s) => DataException(message: o.toString(), stackTrace: s),
          ),
        );
  }
}

final cryptoRepositoryProvider = Provider<CryptoRepository>((ref) {
  return CryptoRepository();
});
