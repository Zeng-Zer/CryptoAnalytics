// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CryptoAsset _$$_CryptoAssetFromJson(Map<String, dynamic> json) =>
    _$_CryptoAsset(
      id: json['id'] as String,
      rank: json['rank'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      supply: double.parse(json['supply'] as String),
      maxSupply: doubleFromNullable(json['maxSupply'] as String?),
      marketCapUsd: double.parse(json['marketCapUsd'] as String),
      volumeUsd24Hr: double.parse(json['volumeUsd24Hr'] as String),
      priceUsd: double.parse(json['priceUsd'] as String),
      changePercent24Hr:
          doubleFromNullable(json['changePercent24Hr'] as String?),
      vwap24Hr: doubleFromNullable(json['vwap24Hr'] as String?),
      logoSvg: json['logoSvg'] as String?,
    );

Map<String, dynamic> _$$_CryptoAssetToJson(_$_CryptoAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'symbol': instance.symbol,
      'name': instance.name,
      'supply': instance.supply,
      'maxSupply': instance.maxSupply,
      'marketCapUsd': instance.marketCapUsd,
      'volumeUsd24Hr': instance.volumeUsd24Hr,
      'priceUsd': instance.priceUsd,
      'changePercent24Hr': instance.changePercent24Hr,
      'vwap24Hr': instance.vwap24Hr,
      'logoSvg': instance.logoSvg,
    };
