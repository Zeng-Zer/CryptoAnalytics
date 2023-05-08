import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_candle.freezed.dart';

// Binance kline data
@freezed
class CryptoCandle with _$CryptoCandle {
  const factory CryptoCandle({
    required int openTime,
    required double open,
    required double high,
    required double low,
    required double close,
    required double volume,
    required int closeTime,
    required double quoteAssetVolume,
    required int numberOfTrades,
    required double takerBuyBaseAssetVolume,
    required double takerBuyQuoteAssetVolume,
  }) = _CryptoCandle;

  factory CryptoCandle.fromList(List<dynamic> list) {
    return CryptoCandle(
      openTime: list[0] as int,
      open: double.parse(list[1] as String),
      high: double.parse(list[2] as String),
      low: double.parse(list[3] as String),
      close: double.parse(list[4] as String),
      volume: double.parse(list[5] as String),
      closeTime: list[6] as int,
      quoteAssetVolume: double.parse(list[7] as String),
      numberOfTrades: list[8] as int,
      takerBuyBaseAssetVolume: double.parse(list[9] as String),
      takerBuyQuoteAssetVolume: double.parse(list[10] as String),
    );
  }
}
