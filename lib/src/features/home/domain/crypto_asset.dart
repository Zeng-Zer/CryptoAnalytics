import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/double_utils.dart';

part 'crypto_asset.freezed.dart';
part 'crypto_asset.g.dart';

@freezed
class CryptoAsset with _$CryptoAsset {
  factory CryptoAsset({
    required String id,
    required String rank,
    required String symbol,
    required String name,
    @JsonKey(fromJson: doubleFromNullable) required double? supply,
    @JsonKey(fromJson: doubleFromNullable) required double? maxSupply,
    @JsonKey(fromJson: doubleFromNullable) required double? marketCapUsd,
    @JsonKey(fromJson: doubleFromNullable) required double? volumeUsd24Hr,
    @JsonKey(fromJson: doubleFromNullable) required double? priceUsd,
    @JsonKey(fromJson: doubleFromNullable) required double? changePercent24Hr,
    @JsonKey(fromJson: doubleFromNullable) required double? vwap24Hr,
    @JsonKey(includeFromJson: false) String? logoSvg,
  }) = _CryptoAsset;

  factory CryptoAsset.fromJson(Map<String, dynamic> json) => _$CryptoAssetFromJson(json);
}
