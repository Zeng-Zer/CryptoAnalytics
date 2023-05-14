import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_order.freezed.dart';
part 'crypto_order.g.dart';

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

    // Ignore toJson serialization
    @JsonKey(fromJson: parseCryptoOrderBidAskList, includeToJson: false)
        required List<CryptoOrderBidAsk> bids,
    @JsonKey(fromJson: parseCryptoOrderBidAskList, includeToJson: false)
        required List<CryptoOrderBidAsk> asks,
  }) = _CryptoOrder;

  factory CryptoOrder.fromJson(Map<String, dynamic> json) => _$CryptoOrderFromJson(json);
}

List<CryptoOrderBidAsk> parseCryptoOrderBidAskList(List<dynamic> list) {
  return list.map((e) => CryptoOrderBidAsk.fromList(e as List<dynamic>)).toList();
}
