// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CryptoTrade _$$_CryptoTradeFromJson(Map<String, dynamic> json) =>
    _$_CryptoTrade(
      exchange: json['exchange'] as String,
      base: json['base'] as String,
      quote: json['quote'] as String,
      direction: directionFromName(json['direction'] as String),
      price: (json['price'] as num).toDouble(),
      volume: (json['volume'] as num).toDouble(),
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp'] as int),
      priceUsd: (json['priceUsd'] as num?)?.toDouble(),
      baseSymbol: json['baseSymbol'] as String?,
      baseName: json['baseName'] as String?,
      quoteSymbol: json['quoteSymbol'] as String?,
      quoteName: json['quoteName'] as String?,
    );

Map<String, dynamic> _$$_CryptoTradeToJson(_$_CryptoTrade instance) =>
    <String, dynamic>{
      'exchange': instance.exchange,
      'base': instance.base,
      'quote': instance.quote,
      'direction': _$DirectionEnumMap[instance.direction]!,
      'price': instance.price,
      'volume': instance.volume,
      'timestamp': instance.timestamp.toIso8601String(),
      'priceUsd': instance.priceUsd,
      'baseSymbol': instance.baseSymbol,
      'baseName': instance.baseName,
      'quoteSymbol': instance.quoteSymbol,
      'quoteName': instance.quoteName,
    };

const _$DirectionEnumMap = {
  Direction.buy: 'buy',
  Direction.sell: 'sell',
};
