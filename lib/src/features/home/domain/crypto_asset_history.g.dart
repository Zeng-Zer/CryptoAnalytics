// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_asset_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CryptoAssetHistory _$$_CryptoAssetHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_CryptoAssetHistory(
      priceUsd: double.parse(json['priceUsd'] as String),
      time: json['time'] as int,
    );

Map<String, dynamic> _$$_CryptoAssetHistoryToJson(
        _$_CryptoAssetHistory instance) =>
    <String, dynamic>{
      'priceUsd': instance.priceUsd,
      'time': instance.time,
    };
