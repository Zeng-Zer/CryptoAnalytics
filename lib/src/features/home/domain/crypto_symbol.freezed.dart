// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_symbol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CryptoSymbol _$CryptoSymbolFromJson(Map<String, dynamic> json) {
  return _CryptoSymbol.fromJson(json);
}

/// @nodoc
mixin _$CryptoSymbol {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoSymbolCopyWith<CryptoSymbol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoSymbolCopyWith<$Res> {
  factory $CryptoSymbolCopyWith(
          CryptoSymbol value, $Res Function(CryptoSymbol) then) =
      _$CryptoSymbolCopyWithImpl<$Res, CryptoSymbol>;
  @useResult
  $Res call({String id, String symbol, String? name});
}

/// @nodoc
class _$CryptoSymbolCopyWithImpl<$Res, $Val extends CryptoSymbol>
    implements $CryptoSymbolCopyWith<$Res> {
  _$CryptoSymbolCopyWithImpl(this._value, this._then);

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
abstract class _$$_CryptoSymbolCopyWith<$Res>
    implements $CryptoSymbolCopyWith<$Res> {
  factory _$$_CryptoSymbolCopyWith(
          _$_CryptoSymbol value, $Res Function(_$_CryptoSymbol) then) =
      __$$_CryptoSymbolCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String symbol, String? name});
}

/// @nodoc
class __$$_CryptoSymbolCopyWithImpl<$Res>
    extends _$CryptoSymbolCopyWithImpl<$Res, _$_CryptoSymbol>
    implements _$$_CryptoSymbolCopyWith<$Res> {
  __$$_CryptoSymbolCopyWithImpl(
      _$_CryptoSymbol _value, $Res Function(_$_CryptoSymbol) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = freezed,
  }) {
    return _then(_$_CryptoSymbol(
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
class _$_CryptoSymbol implements _CryptoSymbol {
  _$_CryptoSymbol({required this.id, required this.symbol, required this.name});

  factory _$_CryptoSymbol.fromJson(Map<String, dynamic> json) =>
      _$$_CryptoSymbolFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String? name;

  @override
  String toString() {
    return 'CryptoSymbol(id: $id, symbol: $symbol, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CryptoSymbol &&
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
  _$$_CryptoSymbolCopyWith<_$_CryptoSymbol> get copyWith =>
      __$$_CryptoSymbolCopyWithImpl<_$_CryptoSymbol>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CryptoSymbolToJson(
      this,
    );
  }
}

abstract class _CryptoSymbol implements CryptoSymbol {
  factory _CryptoSymbol(
      {required final String id,
      required final String symbol,
      required final String? name}) = _$_CryptoSymbol;

  factory _CryptoSymbol.fromJson(Map<String, dynamic> json) =
      _$_CryptoSymbol.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_CryptoSymbolCopyWith<_$_CryptoSymbol> get copyWith =>
      throw _privateConstructorUsedError;
}
