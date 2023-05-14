// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_identifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CryptoIdentifier _$CryptoIdentifierFromJson(Map<String, dynamic> json) {
  return _CryptoIdentifier.fromJson(json);
}

/// @nodoc
mixin _$CryptoIdentifier {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoIdentifierCopyWith<CryptoIdentifier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoIdentifierCopyWith<$Res> {
  factory $CryptoIdentifierCopyWith(
          CryptoIdentifier value, $Res Function(CryptoIdentifier) then) =
      _$CryptoIdentifierCopyWithImpl<$Res, CryptoIdentifier>;
  @useResult
  $Res call({String id, String symbol, String? name});
}

/// @nodoc
class _$CryptoIdentifierCopyWithImpl<$Res, $Val extends CryptoIdentifier>
    implements $CryptoIdentifierCopyWith<$Res> {
  _$CryptoIdentifierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CryptoIdentifierCopyWith<$Res>
    implements $CryptoIdentifierCopyWith<$Res> {
  factory _$$_CryptoIdentifierCopyWith(
          _$_CryptoIdentifier value, $Res Function(_$_CryptoIdentifier) then) =
      __$$_CryptoIdentifierCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String symbol, String? name});
}

/// @nodoc
class __$$_CryptoIdentifierCopyWithImpl<$Res>
    extends _$CryptoIdentifierCopyWithImpl<$Res, _$_CryptoIdentifier>
    implements _$$_CryptoIdentifierCopyWith<$Res> {
  __$$_CryptoIdentifierCopyWithImpl(
      _$_CryptoIdentifier _value, $Res Function(_$_CryptoIdentifier) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = freezed,
  }) {
    return _then(_$_CryptoIdentifier(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CryptoIdentifier implements _CryptoIdentifier {
  _$_CryptoIdentifier(
      {required this.id, required this.symbol, required this.name});

  factory _$_CryptoIdentifier.fromJson(Map<String, dynamic> json) =>
      _$$_CryptoIdentifierFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String? name;

  @override
  String toString() {
    return 'CryptoIdentifier(id: $id, symbol: $symbol, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CryptoIdentifier &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, symbol, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CryptoIdentifierCopyWith<_$_CryptoIdentifier> get copyWith =>
      __$$_CryptoIdentifierCopyWithImpl<_$_CryptoIdentifier>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CryptoIdentifierToJson(
      this,
    );
  }
}

abstract class _CryptoIdentifier implements CryptoIdentifier {
  factory _CryptoIdentifier(
      {required final String id,
      required final String symbol,
      required final String? name}) = _$_CryptoIdentifier;

  factory _CryptoIdentifier.fromJson(Map<String, dynamic> json) =
      _$_CryptoIdentifier.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_CryptoIdentifierCopyWith<_$_CryptoIdentifier> get copyWith =>
      throw _privateConstructorUsedError;
}
