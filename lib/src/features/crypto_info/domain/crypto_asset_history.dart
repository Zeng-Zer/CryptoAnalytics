import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_asset_history.freezed.dart';
part 'crypto_asset_history.g.dart';

@freezed
class CryptoAssetHistory with _$CryptoAssetHistory {
  factory CryptoAssetHistory({
    @JsonKey(fromJson: double.parse) required double priceUsd,
    required int time,
  }) = _CryptoAssetHistory;

  factory CryptoAssetHistory.fromJson(Map<String, dynamic> json) =>
      _$CryptoAssetHistoryFromJson(json);
}
