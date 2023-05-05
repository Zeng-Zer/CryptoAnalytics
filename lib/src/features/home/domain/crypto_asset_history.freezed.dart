// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_asset_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CryptoAssetHistory _$CryptoAssetHistoryFromJson(Map<String, dynamic> json) {
  return _CryptoAssetHistory.fromJson(json);
}

/// @nodoc
mixin _$CryptoAssetHistory {
  @JsonKey(fromJson: double.parse)
  double get priceUsd => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoAssetHistoryCopyWith<CryptoAssetHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoAssetHistoryCopyWith<$Res> {
  factory $CryptoAssetHistoryCopyWith(
          CryptoAssetHistory value, $Res Function(CryptoAssetHistory) then) =
      _$CryptoAssetHistoryCopyWithImpl<$Res, CryptoAssetHistory>;
  @useResult
  $Res call({@JsonKey(fromJson: double.parse) double priceUsd, int time});
}

/// @nodoc
class _$CryptoAssetHistoryCopyWithImpl<$Res, $Val extends CryptoAssetHistory>
    implements $CryptoAssetHistoryCopyWith<$Res> {
  _$CryptoAssetHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceUsd = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CryptoAssetHistoryCopyWith<$Res>
    implements $CryptoAssetHistoryCopyWith<$Res> {
  factory _$$_CryptoAssetHistoryCopyWith(_$_CryptoAssetHistory value,
          $Res Function(_$_CryptoAssetHistory) then) =
      __$$_CryptoAssetHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(fromJson: double.parse) double priceUsd, int time});
}

/// @nodoc
class __$$_CryptoAssetHistoryCopyWithImpl<$Res>
    extends _$CryptoAssetHistoryCopyWithImpl<$Res, _$_CryptoAssetHistory>
    implements _$$_CryptoAssetHistoryCopyWith<$Res> {
  __$$_CryptoAssetHistoryCopyWithImpl(
      _$_CryptoAssetHistory _value, $Res Function(_$_CryptoAssetHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceUsd = null,
    Object? time = null,
  }) {
    return _then(_$_CryptoAssetHistory(
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CryptoAssetHistory implements _CryptoAssetHistory {
  _$_CryptoAssetHistory(
      {@JsonKey(fromJson: double.parse) required this.priceUsd,
      required this.time});

  factory _$_CryptoAssetHistory.fromJson(Map<String, dynamic> json) =>
      _$$_CryptoAssetHistoryFromJson(json);

  @override
  @JsonKey(fromJson: double.parse)
  final double priceUsd;
  @override
  final int time;

  @override
  String toString() {
    return 'CryptoAssetHistory(priceUsd: $priceUsd, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CryptoAssetHistory &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, priceUsd, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CryptoAssetHistoryCopyWith<_$_CryptoAssetHistory> get copyWith =>
      __$$_CryptoAssetHistoryCopyWithImpl<_$_CryptoAssetHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CryptoAssetHistoryToJson(
      this,
    );
  }
}

abstract class _CryptoAssetHistory implements CryptoAssetHistory {
  factory _CryptoAssetHistory(
      {@JsonKey(fromJson: double.parse) required final double priceUsd,
      required final int time}) = _$_CryptoAssetHistory;

  factory _CryptoAssetHistory.fromJson(Map<String, dynamic> json) =
      _$_CryptoAssetHistory.fromJson;

  @override
  @JsonKey(fromJson: double.parse)
  double get priceUsd;
  @override
  int get time;
  @override
  @JsonKey(ignore: true)
  _$$_CryptoAssetHistoryCopyWith<_$_CryptoAssetHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
