// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_binance_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CryptoBinancePair _$$_CryptoBinancePairFromJson(Map<String, dynamic> json) =>
    _$_CryptoBinancePair(
      symbol: json['symbol'] as String,
      baseAsset: json['baseAsset'] as String,
      baseAssetPrecision: json['baseAssetPrecision'] as int,
      quoteAsset: json['quoteAsset'] as String,
      quotePrecision: json['quotePrecision'] as int,
      quoteAssetPrecision: json['quoteAssetPrecision'] as int,
      priceQuote: (json['priceQuote'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_CryptoBinancePairToJson(
        _$_CryptoBinancePair instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'baseAsset': instance.baseAsset,
      'baseAssetPrecision': instance.baseAssetPrecision,
      'quoteAsset': instance.quoteAsset,
      'quotePrecision': instance.quotePrecision,
      'quoteAssetPrecision': instance.quoteAssetPrecision,
      'priceQuote': instance.priceQuote,
    };
