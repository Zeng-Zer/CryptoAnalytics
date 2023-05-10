// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CryptoTicker _$$_CryptoTickerFromJson(Map<String, dynamic> json) =>
    _$_CryptoTicker(
      symbol: json['symbol'] as String,
      priceChange: double.parse(json['priceChange'] as String),
      priceChangePercent: double.parse(json['priceChangePercent'] as String),
      weightedAvgPrice: double.parse(json['weightedAvgPrice'] as String),
      prevClosePrice: double.parse(json['prevClosePrice'] as String),
      lastPrice: double.parse(json['lastPrice'] as String),
      lastQty: double.parse(json['lastQty'] as String),
      bidPrice: double.parse(json['bidPrice'] as String),
      bidQty: double.parse(json['bidQty'] as String),
      askPrice: double.parse(json['askPrice'] as String),
      askQty: double.parse(json['askQty'] as String),
      openPrice: double.parse(json['openPrice'] as String),
      highPrice: double.parse(json['highPrice'] as String),
      lowPrice: double.parse(json['lowPrice'] as String),
      volume: double.parse(json['volume'] as String),
      quoteVolume: double.parse(json['quoteVolume'] as String),
    );

Map<String, dynamic> _$$_CryptoTickerToJson(_$_CryptoTicker instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'priceChange': instance.priceChange,
      'priceChangePercent': instance.priceChangePercent,
      'weightedAvgPrice': instance.weightedAvgPrice,
      'prevClosePrice': instance.prevClosePrice,
      'lastPrice': instance.lastPrice,
      'lastQty': instance.lastQty,
      'bidPrice': instance.bidPrice,
      'bidQty': instance.bidQty,
      'askPrice': instance.askPrice,
      'askQty': instance.askQty,
      'openPrice': instance.openPrice,
      'highPrice': instance.highPrice,
      'lowPrice': instance.lowPrice,
      'volume': instance.volume,
      'quoteVolume': instance.quoteVolume,
    };
