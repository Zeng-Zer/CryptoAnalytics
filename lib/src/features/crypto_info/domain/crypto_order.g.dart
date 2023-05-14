// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CryptoOrder _$$_CryptoOrderFromJson(Map<String, dynamic> json) =>
    _$_CryptoOrder(
      lastUpdateId: json['lastUpdateId'] as int,
      bids: parseCryptoOrderBidAskList(json['bids'] as List),
      asks: parseCryptoOrderBidAskList(json['asks'] as List),
    );

Map<String, dynamic> _$$_CryptoOrderToJson(_$_CryptoOrder instance) =>
    <String, dynamic>{
      'lastUpdateId': instance.lastUpdateId,
    };
