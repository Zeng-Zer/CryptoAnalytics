import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_binance_pair.freezed.dart';
part 'crypto_binance_pair.g.dart';

@freezed
class CryptoBinancePair with _$CryptoBinancePair {
  factory CryptoBinancePair({
    required String symbol,
    required String baseAsset,
    required int baseAssetPrecision,
    required String quoteAsset,
    required int quotePrecision,
    required int quoteAssetPrecision,
    double? priceQuote,
  }) = _CryptoBinancePair;

  factory CryptoBinancePair.fromJson(Map<String, dynamic> json) =>
      _$CryptoBinancePairFromJson(json);
}
