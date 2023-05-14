import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_ticker.freezed.dart';
part 'crypto_ticker.g.dart';

// Binance ticker 24h data
@freezed
class CryptoTicker with _$CryptoTicker {
  const factory CryptoTicker({
    required String symbol,
    @JsonKey(fromJson: double.parse) required double priceChange,
    @JsonKey(fromJson: double.parse) required double priceChangePercent,
    @JsonKey(fromJson: double.parse) required double weightedAvgPrice,
    @JsonKey(fromJson: double.parse) required double prevClosePrice,
    @JsonKey(fromJson: double.parse) required double lastPrice,
    @JsonKey(fromJson: double.parse) required double lastQty,
    @JsonKey(fromJson: double.parse) required double bidPrice,
    @JsonKey(fromJson: double.parse) required double bidQty,
    @JsonKey(fromJson: double.parse) required double askPrice,
    @JsonKey(fromJson: double.parse) required double askQty,
    @JsonKey(fromJson: double.parse) required double openPrice,
    @JsonKey(fromJson: double.parse) required double highPrice,
    @JsonKey(fromJson: double.parse) required double lowPrice,
    @JsonKey(fromJson: double.parse) required double volume,
    @JsonKey(fromJson: double.parse) required double quoteVolume,
  }) = _CryptoTicker;

  factory CryptoTicker.fromJson(Map<String, dynamic> json) => _$CryptoTickerFromJson(json);
}
