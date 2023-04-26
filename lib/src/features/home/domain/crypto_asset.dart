import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_asset.freezed.dart';
part 'crypto_asset.g.dart';

@freezed
class CryptoAsset with _$CryptoAsset {
  const factory CryptoAsset({
    required String id,
    required String rank,
    required String symbol,
    required String name,
    required String supply,
    required String? maxSupply,
    required String marketCapUsd,
    required String volumeUsd24Hr,
    required String priceUsd,
    required String? changePercent24Hr,
    required String? vwap24Hr,
  }) = _CryptoAsset;

  factory CryptoAsset.fromJson(Map<String, dynamic> json) => _$CryptoAssetFromJson(json);
}
