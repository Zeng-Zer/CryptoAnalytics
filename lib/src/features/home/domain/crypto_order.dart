import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_order.freezed.dart';

@freezed
class CryptoOrderBidAsk with _$CryptoOrderBidAsk {
  const factory CryptoOrderBidAsk({
    required double price,
    required double quantity,
  }) = _CryptoOrderBidAsk;

  factory CryptoOrderBidAsk.fromList(List<dynamic> list) {
    return CryptoOrderBidAsk(
      price: double.parse(list[0] as String),
      quantity: double.parse(list[1] as String),
    );
  }
}

// Binance depth
@freezed
class CryptoOrder with _$CryptoOrder {
  const factory CryptoOrder({
    required int lastUpdateId,
    required List<CryptoOrderBidAsk> bids,
    required List<CryptoOrderBidAsk> asks,
  }) = _CryptoOrder;

  factory CryptoOrder.fromJson(List<dynamic> json) {
    return CryptoOrder(
      lastUpdateId: json[0] as int,
      bids: (json[1] as List<dynamic>)
          .map((e) => CryptoOrderBidAsk.fromList(e as List<dynamic>))
          .toList(),
      asks: (json[2] as List<dynamic>)
          .map((e) => CryptoOrderBidAsk.fromList(e as List<dynamic>))
          .toList(),
    );
  }
}
