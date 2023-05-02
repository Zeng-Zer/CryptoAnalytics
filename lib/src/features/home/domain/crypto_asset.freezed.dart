// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CryptoAsset _$CryptoAssetFromJson(Map<String, dynamic> json) {
  return _CryptoAsset.fromJson(json);
}

/// @nodoc
mixin _$CryptoAsset {
  String get id => throw _privateConstructorUsedError;
  String get rank => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: double.parse)
  double get supply => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromNullable)
  double? get maxSupply => throw _privateConstructorUsedError;
  @JsonKey(fromJson: double.parse)
  double get marketCapUsd => throw _privateConstructorUsedError;
  @JsonKey(fromJson: double.parse)
  double get volumeUsd24Hr => throw _privateConstructorUsedError;
  @JsonKey(fromJson: double.parse)
  double get priceUsd => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromNullable)
  double? get changePercent24Hr => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromNullable)
  double? get vwap24Hr => throw _privateConstructorUsedError;
  String? get logoSvg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoAssetCopyWith<CryptoAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoAssetCopyWith<$Res> {
  factory $CryptoAssetCopyWith(
          CryptoAsset value, $Res Function(CryptoAsset) then) =
      _$CryptoAssetCopyWithImpl<$Res, CryptoAsset>;
  @useResult
  $Res call(
      {String id,
      String rank,
      String symbol,
      String name,
      @JsonKey(fromJson: double.parse) double supply,
      @JsonKey(fromJson: doubleFromNullable) double? maxSupply,
      @JsonKey(fromJson: double.parse) double marketCapUsd,
      @JsonKey(fromJson: double.parse) double volumeUsd24Hr,
      @JsonKey(fromJson: double.parse) double priceUsd,
      @JsonKey(fromJson: doubleFromNullable) double? changePercent24Hr,
      @JsonKey(fromJson: doubleFromNullable) double? vwap24Hr,
      String? logoSvg});
}

/// @nodoc
class _$CryptoAssetCopyWithImpl<$Res, $Val extends CryptoAsset>
    implements $CryptoAssetCopyWith<$Res> {
  _$CryptoAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rank = null,
    Object? symbol = null,
    Object? name = null,
    Object? supply = null,
    Object? maxSupply = freezed,
    Object? marketCapUsd = null,
    Object? volumeUsd24Hr = null,
    Object? priceUsd = null,
    Object? changePercent24Hr = freezed,
    Object? vwap24Hr = freezed,
    Object? logoSvg = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      supply: null == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as double,
      maxSupply: freezed == maxSupply
          ? _value.maxSupply
          : maxSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      marketCapUsd: null == marketCapUsd
          ? _value.marketCapUsd
          : marketCapUsd // ignore: cast_nullable_to_non_nullable
              as double,
      volumeUsd24Hr: null == volumeUsd24Hr
          ? _value.volumeUsd24Hr
          : volumeUsd24Hr // ignore: cast_nullable_to_non_nullable
              as double,
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double,
      changePercent24Hr: freezed == changePercent24Hr
          ? _value.changePercent24Hr
          : changePercent24Hr // ignore: cast_nullable_to_non_nullable
              as double?,
      vwap24Hr: freezed == vwap24Hr
          ? _value.vwap24Hr
          : vwap24Hr // ignore: cast_nullable_to_non_nullable
              as double?,
      logoSvg: freezed == logoSvg
          ? _value.logoSvg
          : logoSvg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CryptoAssetCopyWith<$Res>
    implements $CryptoAssetCopyWith<$Res> {
  factory _$$_CryptoAssetCopyWith(
          _$_CryptoAsset value, $Res Function(_$_CryptoAsset) then) =
      __$$_CryptoAssetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String rank,
      String symbol,
      String name,
      @JsonKey(fromJson: double.parse) double supply,
      @JsonKey(fromJson: doubleFromNullable) double? maxSupply,
      @JsonKey(fromJson: double.parse) double marketCapUsd,
      @JsonKey(fromJson: double.parse) double volumeUsd24Hr,
      @JsonKey(fromJson: double.parse) double priceUsd,
      @JsonKey(fromJson: doubleFromNullable) double? changePercent24Hr,
      @JsonKey(fromJson: doubleFromNullable) double? vwap24Hr,
      String? logoSvg});
}

/// @nodoc
class __$$_CryptoAssetCopyWithImpl<$Res>
    extends _$CryptoAssetCopyWithImpl<$Res, _$_CryptoAsset>
    implements _$$_CryptoAssetCopyWith<$Res> {
  __$$_CryptoAssetCopyWithImpl(
      _$_CryptoAsset _value, $Res Function(_$_CryptoAsset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rank = null,
    Object? symbol = null,
    Object? name = null,
    Object? supply = null,
    Object? maxSupply = freezed,
    Object? marketCapUsd = null,
    Object? volumeUsd24Hr = null,
    Object? priceUsd = null,
    Object? changePercent24Hr = freezed,
    Object? vwap24Hr = freezed,
    Object? logoSvg = freezed,
  }) {
    return _then(_$_CryptoAsset(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      supply: null == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as double,
      maxSupply: freezed == maxSupply
          ? _value.maxSupply
          : maxSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      marketCapUsd: null == marketCapUsd
          ? _value.marketCapUsd
          : marketCapUsd // ignore: cast_nullable_to_non_nullable
              as double,
      volumeUsd24Hr: null == volumeUsd24Hr
          ? _value.volumeUsd24Hr
          : volumeUsd24Hr // ignore: cast_nullable_to_non_nullable
              as double,
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double,
      changePercent24Hr: freezed == changePercent24Hr
          ? _value.changePercent24Hr
          : changePercent24Hr // ignore: cast_nullable_to_non_nullable
              as double?,
      vwap24Hr: freezed == vwap24Hr
          ? _value.vwap24Hr
          : vwap24Hr // ignore: cast_nullable_to_non_nullable
              as double?,
      logoSvg: freezed == logoSvg
          ? _value.logoSvg
          : logoSvg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CryptoAsset implements _CryptoAsset {
  _$_CryptoAsset(
      {required this.id,
      required this.rank,
      required this.symbol,
      required this.name,
      @JsonKey(fromJson: double.parse) required this.supply,
      @JsonKey(fromJson: doubleFromNullable) required this.maxSupply,
      @JsonKey(fromJson: double.parse) required this.marketCapUsd,
      @JsonKey(fromJson: double.parse) required this.volumeUsd24Hr,
      @JsonKey(fromJson: double.parse) required this.priceUsd,
      @JsonKey(fromJson: doubleFromNullable) required this.changePercent24Hr,
      @JsonKey(fromJson: doubleFromNullable) required this.vwap24Hr,
      this.logoSvg});

  factory _$_CryptoAsset.fromJson(Map<String, dynamic> json) =>
      _$$_CryptoAssetFromJson(json);

  @override
  final String id;
  @override
  final String rank;
  @override
  final String symbol;
  @override
  final String name;
  @override
  @JsonKey(fromJson: double.parse)
  final double supply;
  @override
  @JsonKey(fromJson: doubleFromNullable)
  final double? maxSupply;
  @override
  @JsonKey(fromJson: double.parse)
  final double marketCapUsd;
  @override
  @JsonKey(fromJson: double.parse)
  final double volumeUsd24Hr;
  @override
  @JsonKey(fromJson: double.parse)
  final double priceUsd;
  @override
  @JsonKey(fromJson: doubleFromNullable)
  final double? changePercent24Hr;
  @override
  @JsonKey(fromJson: doubleFromNullable)
  final double? vwap24Hr;
  @override
  final String? logoSvg;

  @override
  String toString() {
    return 'CryptoAsset(id: $id, rank: $rank, symbol: $symbol, name: $name, supply: $supply, maxSupply: $maxSupply, marketCapUsd: $marketCapUsd, volumeUsd24Hr: $volumeUsd24Hr, priceUsd: $priceUsd, changePercent24Hr: $changePercent24Hr, vwap24Hr: $vwap24Hr, logoSvg: $logoSvg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CryptoAsset &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.maxSupply, maxSupply) ||
                other.maxSupply == maxSupply) &&
            (identical(other.marketCapUsd, marketCapUsd) ||
                other.marketCapUsd == marketCapUsd) &&
            (identical(other.volumeUsd24Hr, volumeUsd24Hr) ||
                other.volumeUsd24Hr == volumeUsd24Hr) &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(other.changePercent24Hr, changePercent24Hr) ||
                other.changePercent24Hr == changePercent24Hr) &&
            (identical(other.vwap24Hr, vwap24Hr) ||
                other.vwap24Hr == vwap24Hr) &&
            (identical(other.logoSvg, logoSvg) || other.logoSvg == logoSvg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      rank,
      symbol,
      name,
      supply,
      maxSupply,
      marketCapUsd,
      volumeUsd24Hr,
      priceUsd,
      changePercent24Hr,
      vwap24Hr,
      logoSvg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CryptoAssetCopyWith<_$_CryptoAsset> get copyWith =>
      __$$_CryptoAssetCopyWithImpl<_$_CryptoAsset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CryptoAssetToJson(
      this,
    );
  }
}

abstract class _CryptoAsset implements CryptoAsset {
  factory _CryptoAsset(
      {required final String id,
      required final String rank,
      required final String symbol,
      required final String name,
      @JsonKey(fromJson: double.parse)
          required final double supply,
      @JsonKey(fromJson: doubleFromNullable)
          required final double? maxSupply,
      @JsonKey(fromJson: double.parse)
          required final double marketCapUsd,
      @JsonKey(fromJson: double.parse)
          required final double volumeUsd24Hr,
      @JsonKey(fromJson: double.parse)
          required final double priceUsd,
      @JsonKey(fromJson: doubleFromNullable)
          required final double? changePercent24Hr,
      @JsonKey(fromJson: doubleFromNullable)
          required final double? vwap24Hr,
      final String? logoSvg}) = _$_CryptoAsset;

  factory _CryptoAsset.fromJson(Map<String, dynamic> json) =
      _$_CryptoAsset.fromJson;

  @override
  String get id;
  @override
  String get rank;
  @override
  String get symbol;
  @override
  String get name;
  @override
  @JsonKey(fromJson: double.parse)
  double get supply;
  @override
  @JsonKey(fromJson: doubleFromNullable)
  double? get maxSupply;
  @override
  @JsonKey(fromJson: double.parse)
  double get marketCapUsd;
  @override
  @JsonKey(fromJson: double.parse)
  double get volumeUsd24Hr;
  @override
  @JsonKey(fromJson: double.parse)
  double get priceUsd;
  @override
  @JsonKey(fromJson: doubleFromNullable)
  double? get changePercent24Hr;
  @override
  @JsonKey(fromJson: doubleFromNullable)
  double? get vwap24Hr;
  @override
  String? get logoSvg;
  @override
  @JsonKey(ignore: true)
  _$$_CryptoAssetCopyWith<_$_CryptoAsset> get copyWith =>
      throw _privateConstructorUsedError;
}
