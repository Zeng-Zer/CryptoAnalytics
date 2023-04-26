// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CryptoPair _$$_CryptoPairFromJson(Map<String, dynamic> json) =>
    _$_CryptoPair(
      exchangeId: json['exchangeId'] as String,
      baseSymbol: json['baseSymbol'] as String,
      baseId: json['baseId'] as String,
      quoteSymbol: json['quoteSymbol'] as String,
      quoteId: json['quoteId'] as String,
      priceUsd: json['priceUsd'] as String,
      volumeUsd24Hr: json['volumeUsd24Hr'] as String?,
      percentExchangeVolume: json['percentExchangeVolume'] as String?,
      tradesCount24Hr: json['tradesCount24Hr'] as String?,
      updated: json['updated'] as int,
    );

Map<String, dynamic> _$$_CryptoPairToJson(_$_CryptoPair instance) =>
    <String, dynamic>{
      'exchangeId': instance.exchangeId,
      'baseSymbol': instance.baseSymbol,
      'baseId': instance.baseId,
      'quoteSymbol': instance.quoteSymbol,
      'quoteId': instance.quoteId,
      'priceUsd': instance.priceUsd,
      'volumeUsd24Hr': instance.volumeUsd24Hr,
      'percentExchangeVolume': instance.percentExchangeVolume,
      'tradesCount24Hr': instance.tradesCount24Hr,
      'updated': instance.updated,
    };
