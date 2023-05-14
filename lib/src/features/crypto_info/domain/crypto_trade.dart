import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_trade.freezed.dart';
part 'crypto_trade.g.dart';

enum Direction { buy, sell }

Direction directionFromName(String name) =>
    name.isEmpty ? Direction.buy : Direction.values.byName(name);

@freezed
class CryptoTrade with _$CryptoTrade {
  factory CryptoTrade({
    required String exchange,
    required String base,
    required String quote,
    @JsonKey(fromJson: directionFromName) required Direction direction,
    required double price,
    required double volume,
    @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch) required DateTime timestamp,
    required double? priceUsd,
    String? baseSymbol,
    String? baseName,
    String? quoteSymbol,
    String? quoteName,
  }) = _CryptoTrade;

  factory CryptoTrade.fromJson(Map<String, dynamic> json) => _$CryptoTradeFromJson(json);
}
