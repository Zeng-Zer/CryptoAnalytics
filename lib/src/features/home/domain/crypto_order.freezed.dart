// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CryptoOrderBidAsk {
  double get price => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CryptoOrderBidAskCopyWith<CryptoOrderBidAsk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoOrderBidAskCopyWith<$Res> {
  factory $CryptoOrderBidAskCopyWith(
          CryptoOrderBidAsk value, $Res Function(CryptoOrderBidAsk) then) =
      _$CryptoOrderBidAskCopyWithImpl<$Res, CryptoOrderBidAsk>;
  @useResult
  $Res call({double price, double quantity});
}

/// @nodoc
class _$CryptoOrderBidAskCopyWithImpl<$Res, $Val extends CryptoOrderBidAsk>
    implements $CryptoOrderBidAskCopyWith<$Res> {
  _$CryptoOrderBidAskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CryptoOrderBidAskCopyWith<$Res>
    implements $CryptoOrderBidAskCopyWith<$Res> {
  factory _$$_CryptoOrderBidAskCopyWith(_$_CryptoOrderBidAsk value,
          $Res Function(_$_CryptoOrderBidAsk) then) =
      __$$_CryptoOrderBidAskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double price, double quantity});
}

/// @nodoc
class __$$_CryptoOrderBidAskCopyWithImpl<$Res>
    extends _$CryptoOrderBidAskCopyWithImpl<$Res, _$_CryptoOrderBidAsk>
    implements _$$_CryptoOrderBidAskCopyWith<$Res> {
  __$$_CryptoOrderBidAskCopyWithImpl(
      _$_CryptoOrderBidAsk _value, $Res Function(_$_CryptoOrderBidAsk) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? quantity = null,
  }) {
    return _then(_$_CryptoOrderBidAsk(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_CryptoOrderBidAsk implements _CryptoOrderBidAsk {
  const _$_CryptoOrderBidAsk({required this.price, required this.quantity});

  @override
  final double price;
  @override
  final double quantity;

  @override
  String toString() {
    return 'CryptoOrderBidAsk(price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CryptoOrderBidAsk &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, price, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CryptoOrderBidAskCopyWith<_$_CryptoOrderBidAsk> get copyWith =>
      __$$_CryptoOrderBidAskCopyWithImpl<_$_CryptoOrderBidAsk>(
          this, _$identity);
}

abstract class _CryptoOrderBidAsk implements CryptoOrderBidAsk {
  const factory _CryptoOrderBidAsk(
      {required final double price,
      required final double quantity}) = _$_CryptoOrderBidAsk;

  @override
  double get price;
  @override
  double get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_CryptoOrderBidAskCopyWith<_$_CryptoOrderBidAsk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CryptoOrder {
  int get lastUpdateId => throw _privateConstructorUsedError;
  List<CryptoOrderBidAsk> get bids => throw _privateConstructorUsedError;
  List<CryptoOrderBidAsk> get asks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CryptoOrderCopyWith<CryptoOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoOrderCopyWith<$Res> {
  factory $CryptoOrderCopyWith(
          CryptoOrder value, $Res Function(CryptoOrder) then) =
      _$CryptoOrderCopyWithImpl<$Res, CryptoOrder>;
  @useResult
  $Res call(
      {int lastUpdateId,
      List<CryptoOrderBidAsk> bids,
      List<CryptoOrderBidAsk> asks});
}

/// @nodoc
class _$CryptoOrderCopyWithImpl<$Res, $Val extends CryptoOrder>
    implements $CryptoOrderCopyWith<$Res> {
  _$CryptoOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdateId = null,
    Object? bids = null,
    Object? asks = null,
  }) {
    return _then(_value.copyWith(
      lastUpdateId: null == lastUpdateId
          ? _value.lastUpdateId
          : lastUpdateId // ignore: cast_nullable_to_non_nullable
              as int,
      bids: null == bids
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<CryptoOrderBidAsk>,
      asks: null == asks
          ? _value.asks
          : asks // ignore: cast_nullable_to_non_nullable
              as List<CryptoOrderBidAsk>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CryptoOrderCopyWith<$Res>
    implements $CryptoOrderCopyWith<$Res> {
  factory _$$_CryptoOrderCopyWith(
          _$_CryptoOrder value, $Res Function(_$_CryptoOrder) then) =
      __$$_CryptoOrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int lastUpdateId,
      List<CryptoOrderBidAsk> bids,
      List<CryptoOrderBidAsk> asks});
}

/// @nodoc
class __$$_CryptoOrderCopyWithImpl<$Res>
    extends _$CryptoOrderCopyWithImpl<$Res, _$_CryptoOrder>
    implements _$$_CryptoOrderCopyWith<$Res> {
  __$$_CryptoOrderCopyWithImpl(
      _$_CryptoOrder _value, $Res Function(_$_CryptoOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdateId = null,
    Object? bids = null,
    Object? asks = null,
  }) {
    return _then(_$_CryptoOrder(
      lastUpdateId: null == lastUpdateId
          ? _value.lastUpdateId
          : lastUpdateId // ignore: cast_nullable_to_non_nullable
              as int,
      bids: null == bids
          ? _value._bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<CryptoOrderBidAsk>,
      asks: null == asks
          ? _value._asks
          : asks // ignore: cast_nullable_to_non_nullable
              as List<CryptoOrderBidAsk>,
    ));
  }
}

/// @nodoc

class _$_CryptoOrder implements _CryptoOrder {
  const _$_CryptoOrder(
      {required this.lastUpdateId,
      required final List<CryptoOrderBidAsk> bids,
      required final List<CryptoOrderBidAsk> asks})
      : _bids = bids,
        _asks = asks;

  @override
  final int lastUpdateId;
  final List<CryptoOrderBidAsk> _bids;
  @override
  List<CryptoOrderBidAsk> get bids {
    if (_bids is EqualUnmodifiableListView) return _bids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bids);
  }

  final List<CryptoOrderBidAsk> _asks;
  @override
  List<CryptoOrderBidAsk> get asks {
    if (_asks is EqualUnmodifiableListView) return _asks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_asks);
  }

  @override
  String toString() {
    return 'CryptoOrder(lastUpdateId: $lastUpdateId, bids: $bids, asks: $asks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CryptoOrder &&
            (identical(other.lastUpdateId, lastUpdateId) ||
                other.lastUpdateId == lastUpdateId) &&
            const DeepCollectionEquality().equals(other._bids, _bids) &&
            const DeepCollectionEquality().equals(other._asks, _asks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      lastUpdateId,
      const DeepCollectionEquality().hash(_bids),
      const DeepCollectionEquality().hash(_asks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CryptoOrderCopyWith<_$_CryptoOrder> get copyWith =>
      __$$_CryptoOrderCopyWithImpl<_$_CryptoOrder>(this, _$identity);
}

abstract class _CryptoOrder implements CryptoOrder {
  const factory _CryptoOrder(
      {required final int lastUpdateId,
      required final List<CryptoOrderBidAsk> bids,
      required final List<CryptoOrderBidAsk> asks}) = _$_CryptoOrder;

  @override
  int get lastUpdateId;
  @override
  List<CryptoOrderBidAsk> get bids;
  @override
  List<CryptoOrderBidAsk> get asks;
  @override
  @JsonKey(ignore: true)
  _$$_CryptoOrderCopyWith<_$_CryptoOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
