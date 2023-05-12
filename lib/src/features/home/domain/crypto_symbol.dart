import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_symbol.freezed.dart';
part 'crypto_symbol.g.dart';

@freezed
class CryptoSymbol with _$CryptoSymbol {
  factory CryptoSymbol({
    required String id,
    required String symbol,
    required String? name,
  }) = _CryptoSymbol;

  factory CryptoSymbol.fromJson(Map<String, dynamic> json) => _$CryptoSymbolFromJson(json);
}
