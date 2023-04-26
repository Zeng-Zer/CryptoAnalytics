import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_pair.freezed.dart';
part 'crypto_pair.g.dart';

@freezed
class CryptoPair with _$CryptoPair {
  const factory CryptoPair({
    required String exchangeId,
    required String baseSymbol,
    required String baseId,
    required String quoteSymbol,
    required String quoteId,
    required String priceUsd,
    required String? volumeUsd24Hr,
    required String? percentExchangeVolume,
    required String? tradesCount24Hr,
    required int updated,
  }) = _CryptoPair;

  factory CryptoPair.fromJson(Map<String, dynamic> json) => _$CryptoPairFromJson(json);
}
