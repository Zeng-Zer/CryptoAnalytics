// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_asset_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchLogoHash() => r'15083165c956424a06de10a2b9792a3c5e1493d5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FetchLogoRef = AutoDisposeFutureProviderRef<String>;

/// See also [fetchLogo].
@ProviderFor(fetchLogo)
const fetchLogoProvider = FetchLogoFamily();

/// See also [fetchLogo].
class FetchLogoFamily extends Family<AsyncValue<String>> {
  /// See also [fetchLogo].
  const FetchLogoFamily();

  /// See also [fetchLogo].
  FetchLogoProvider call(
    String symbol,
  ) {
    return FetchLogoProvider(
      symbol,
    );
  }

  @override
  FetchLogoProvider getProviderOverride(
    covariant FetchLogoProvider provider,
  ) {
    return call(
      provider.symbol,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchLogoProvider';
}

/// See also [fetchLogo].
class FetchLogoProvider extends AutoDisposeFutureProvider<String> {
  /// See also [fetchLogo].
  FetchLogoProvider(
    this.symbol,
  ) : super.internal(
          (ref) => fetchLogo(
            ref,
            symbol,
          ),
          from: fetchLogoProvider,
          name: r'fetchLogoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchLogoHash,
          dependencies: FetchLogoFamily._dependencies,
          allTransitiveDependencies: FetchLogoFamily._allTransitiveDependencies,
        );

  final String symbol;

  @override
  bool operator ==(Object other) {
    return other is FetchLogoProvider && other.symbol == symbol;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, symbol.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchAssetsHash() => r'149a76e449be3b3892305e55564562c4be667abc';

/// See also [fetchAssets].
@ProviderFor(fetchAssets)
final fetchAssetsProvider =
    AutoDisposeFutureProvider<List<CryptoAsset>>.internal(
  fetchAssets,
  name: r'fetchAssetsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchAssetsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAssetsRef = AutoDisposeFutureProviderRef<List<CryptoAsset>>;
String _$fetchAssetHash() => r'9ece80336b726f6891305ecd3160a2e1f0d1ba27';
typedef FetchAssetRef = AutoDisposeFutureProviderRef<CryptoAsset>;

/// See also [fetchAsset].
@ProviderFor(fetchAsset)
const fetchAssetProvider = FetchAssetFamily();

/// See also [fetchAsset].
class FetchAssetFamily extends Family<AsyncValue<CryptoAsset>> {
  /// See also [fetchAsset].
  const FetchAssetFamily();

  /// See also [fetchAsset].
  FetchAssetProvider call(
    String assetId,
  ) {
    return FetchAssetProvider(
      assetId,
    );
  }

  @override
  FetchAssetProvider getProviderOverride(
    covariant FetchAssetProvider provider,
  ) {
    return call(
      provider.assetId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchAssetProvider';
}

/// See also [fetchAsset].
class FetchAssetProvider extends AutoDisposeFutureProvider<CryptoAsset> {
  /// See also [fetchAsset].
  FetchAssetProvider(
    this.assetId,
  ) : super.internal(
          (ref) => fetchAsset(
            ref,
            assetId,
          ),
          from: fetchAssetProvider,
          name: r'fetchAssetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAssetHash,
          dependencies: FetchAssetFamily._dependencies,
          allTransitiveDependencies:
              FetchAssetFamily._allTransitiveDependencies,
        );

  final String assetId;

  @override
  bool operator ==(Object other) {
    return other is FetchAssetProvider && other.assetId == assetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, assetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchAssetHistoryHash() => r'af08b7cdaabc31f8e6821811aa881bdda229283e';
typedef FetchAssetHistoryRef
    = AutoDisposeFutureProviderRef<List<CryptoAssetHistory>>;

/// See also [fetchAssetHistory].
@ProviderFor(fetchAssetHistory)
const fetchAssetHistoryProvider = FetchAssetHistoryFamily();

/// See also [fetchAssetHistory].
class FetchAssetHistoryFamily
    extends Family<AsyncValue<List<CryptoAssetHistory>>> {
  /// See also [fetchAssetHistory].
  const FetchAssetHistoryFamily();

  /// See also [fetchAssetHistory].
  FetchAssetHistoryProvider call({
    required String assetId,
    bool refresh = false,
  }) {
    return FetchAssetHistoryProvider(
      assetId: assetId,
      refresh: refresh,
    );
  }

  @override
  FetchAssetHistoryProvider getProviderOverride(
    covariant FetchAssetHistoryProvider provider,
  ) {
    return call(
      assetId: provider.assetId,
      refresh: provider.refresh,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchAssetHistoryProvider';
}

/// See also [fetchAssetHistory].
class FetchAssetHistoryProvider
    extends AutoDisposeFutureProvider<List<CryptoAssetHistory>> {
  /// See also [fetchAssetHistory].
  FetchAssetHistoryProvider({
    required this.assetId,
    this.refresh = false,
  }) : super.internal(
          (ref) => fetchAssetHistory(
            ref,
            assetId: assetId,
            refresh: refresh,
          ),
          from: fetchAssetHistoryProvider,
          name: r'fetchAssetHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAssetHistoryHash,
          dependencies: FetchAssetHistoryFamily._dependencies,
          allTransitiveDependencies:
              FetchAssetHistoryFamily._allTransitiveDependencies,
        );

  final String assetId;
  final bool refresh;

  @override
  bool operator ==(Object other) {
    return other is FetchAssetHistoryProvider &&
        other.assetId == assetId &&
        other.refresh == refresh;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, assetId.hashCode);
    hash = _SystemHash.combine(hash, refresh.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
