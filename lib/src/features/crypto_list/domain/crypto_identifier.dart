import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_identifier.freezed.dart';
part 'crypto_identifier.g.dart';

@freezed
class CryptoIdentifier with _$CryptoIdentifier {
  factory CryptoIdentifier({
    required String id,
    required String symbol,
    required String? name,
  }) = _CryptoIdentifier;

  factory CryptoIdentifier.fromJson(Map<String, dynamic> json) => _$CryptoIdentifierFromJson(json);
}
