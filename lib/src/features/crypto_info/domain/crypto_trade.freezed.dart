// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_trade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CryptoTrade _$CryptoTradeFromJson(Map<String, dynamic> json) {
  return _CryptoTrade.fromJson(json);
}

/// @nodoc
mixin _$CryptoTrade {
  String get exchange => throw _privateConstructorUsedError;
  String get base => throw _privateConstructorUsedError;
  String get quote => throw _privateConstructorUsedError;
  @JsonKey(fromJson: directionFromName)
  Direction get direction => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  DateTime get timestamp => throw _privateConstructorUsedError;
  double? get priceUsd => throw _privateConstructorUsedError;
  String? get baseSymbol => throw _privateConstructorUsedError;
  String? get baseName => throw _privateConstructorUsedError;
  String? get quoteSymbol => throw _privateConstructorUsedError;
  String? get quoteName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoTradeCopyWith<CryptoTrade> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoTradeCopyWith<$Res> {
  factory $CryptoTradeCopyWith(
          CryptoTrade value, $Res Function(CryptoTrade) then) =
      _$CryptoTradeCopyWithImpl<$Res, CryptoTrade>;
  @useResult
  $Res call(
      {String exchange,
      String base,
      String quote,
      @JsonKey(fromJson: directionFromName)
          Direction direction,
      double price,
      double volume,
      @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
          DateTime timestamp,
      double? priceUsd,
      String? baseSymbol,
      String? baseName,
      String? quoteSymbol,
      String? quoteName});
}

/// @nodoc
class _$CryptoTradeCopyWithImpl<$Res, $Val extends CryptoTrade>
    implements $CryptoTradeCopyWith<$Res> {
  _$CryptoTradeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exchange = null,
    Object? base = null,
    Object? quote = null,
    Object? direction = null,
    Object? price = null,
    Object? volume = null,
    Object? timestamp = null,
    Object? priceUsd = freezed,
    Object? baseSymbol = freezed,
    Object? baseName = freezed,
    Object? quoteSymbol = freezed,
    Object? quoteName = freezed,
  }) {
    return _then(_value.copyWith(
      exchange: null == exchange
          ? _value.exchange
          : exchange // ignore: cast_nullable_to_non_nullable
              as String,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priceUsd: freezed == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double?,
      baseSymbol: freezed == baseSymbol
          ? _value.baseSymbol
          : baseSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      baseName: freezed == baseName
          ? _value.baseName
          : baseName // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteSymbol: freezed == quoteSymbol
          ? _value.quoteSymbol
          : quoteSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteName: freezed == quoteName
          ? _value.quoteName
          : quoteName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CryptoTradeCopyWith<$Res>
    implements $CryptoTradeCopyWith<$Res> {
  factory _$$_CryptoTradeCopyWith(
          _$_CryptoTrade value, $Res Function(_$_CryptoTrade) then) =
      __$$_CryptoTradeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exchange,
      String base,
      String quote,
      @JsonKey(fromJson: directionFromName)
          Direction direction,
      double price,
      double volume,
      @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
          DateTime timestamp,
      double? priceUsd,
      String? baseSymbol,
      String? baseName,
      String? quoteSymbol,
      String? quoteName});
}

/// @nodoc
class __$$_CryptoTradeCopyWithImpl<$Res>
    extends _$CryptoTradeCopyWithImpl<$Res, _$_CryptoTrade>
    implements _$$_CryptoTradeCopyWith<$Res> {
  __$$_CryptoTradeCopyWithImpl(
      _$_CryptoTrade _value, $Res Function(_$_CryptoTrade) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exchange = null,
    Object? base = null,
    Object? quote = null,
    Object? direction = null,
    Object? price = null,
    Object? volume = null,
    Object? timestamp = null,
    Object? priceUsd = freezed,
    Object? baseSymbol = freezed,
    Object? baseName = freezed,
    Object? quoteSymbol = freezed,
    Object? quoteName = freezed,
  }) {
    return _then(_$_CryptoTrade(
      exchange: null == exchange
          ? _value.exchange
          : exchange // ignore: cast_nullable_to_non_nullable
              as String,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priceUsd: freezed == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double?,
      baseSymbol: freezed == baseSymbol
          ? _value.baseSymbol
          : baseSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      baseName: freezed == baseName
          ? _value.baseName
          : baseName // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteSymbol: freezed == quoteSymbol
          ? _value.quoteSymbol
          : quoteSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteName: freezed == quoteName
          ? _value.quoteName
          : quoteName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CryptoTrade implements _CryptoTrade {
  _$_CryptoTrade(
      {required this.exchange,
      required this.base,
      required this.quote,
      @JsonKey(fromJson: directionFromName)
          required this.direction,
      required this.price,
      required this.volume,
      @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
          required this.timestamp,
      required this.priceUsd,
      this.baseSymbol,
      this.baseName,
      this.quoteSymbol,
      this.quoteName});

  factory _$_CryptoTrade.fromJson(Map<String, dynamic> json) =>
      _$$_CryptoTradeFromJson(json);

  @override
  final String exchange;
  @override
  final String base;
  @override
  final String quote;
  @override
  @JsonKey(fromJson: directionFromName)
  final Direction direction;
  @override
  final double price;
  @override
  final double volume;
  @override
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  final DateTime timestamp;
  @override
  final double? priceUsd;
  @override
  final String? baseSymbol;
  @override
  final String? baseName;
  @override
  final String? quoteSymbol;
  @override
  final String? quoteName;

  @override
  String toString() {
    return 'CryptoTrade(exchange: $exchange, base: $base, quote: $quote, direction: $direction, price: $price, volume: $volume, timestamp: $timestamp, priceUsd: $priceUsd, baseSymbol: $baseSymbol, baseName: $baseName, quoteSymbol: $quoteSymbol, quoteName: $quoteName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CryptoTrade &&
            (identical(other.exchange, exchange) ||
                other.exchange == exchange) &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(other.baseSymbol, baseSymbol) ||
                other.baseSymbol == baseSymbol) &&
            (identical(other.baseName, baseName) ||
                other.baseName == baseName) &&
            (identical(other.quoteSymbol, quoteSymbol) ||
                other.quoteSymbol == quoteSymbol) &&
            (identical(other.quoteName, quoteName) ||
                other.quoteName == quoteName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      exchange,
      base,
      quote,
      direction,
      price,
      volume,
      timestamp,
      priceUsd,
      baseSymbol,
      baseName,
      quoteSymbol,
      quoteName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CryptoTradeCopyWith<_$_CryptoTrade> get copyWith =>
      __$$_CryptoTradeCopyWithImpl<_$_CryptoTrade>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CryptoTradeToJson(
      this,
    );
  }
}

abstract class _CryptoTrade implements CryptoTrade {
  factory _CryptoTrade(
      {required final String exchange,
      required final String base,
      required final String quote,
      @JsonKey(fromJson: directionFromName)
          required final Direction direction,
      required final double price,
      required final double volume,
      @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
          required final DateTime timestamp,
      required final double? priceUsd,
      final String? baseSymbol,
      final String? baseName,
      final String? quoteSymbol,
      final String? quoteName}) = _$_CryptoTrade;

  factory _CryptoTrade.fromJson(Map<String, dynamic> json) =
      _$_CryptoTrade.fromJson;

  @override
  String get exchange;
  @override
  String get base;
  @override
  String get quote;
  @override
  @JsonKey(fromJson: directionFromName)
  Direction get direction;
  @override
  double get price;
  @override
  double get volume;
  @override
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  DateTime get timestamp;
  @override
  double? get priceUsd;
  @override
  String? get baseSymbol;
  @override
  String? get baseName;
  @override
  String? get quoteSymbol;
  @override
  String? get quoteName;
  @override
  @JsonKey(ignore: true)
  _$$_CryptoTradeCopyWith<_$_CryptoTrade> get copyWith =>
      throw _privateConstructorUsedError;
}
