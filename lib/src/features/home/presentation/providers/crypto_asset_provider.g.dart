// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_asset_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchLogoHash() => r'01073842b46a86ead3245507cc3caa3995b4943c';

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

typedef FetchLogoRef = AutoDisposeFutureProviderRef<String?>;

/// See also [fetchLogo].
@ProviderFor(fetchLogo)
const fetchLogoProvider = FetchLogoFamily();

/// See also [fetchLogo].
class FetchLogoFamily extends Family<AsyncValue<String?>> {
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
class FetchLogoProvider extends AutoDisposeFutureProvider<String?> {
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

String _$fetchAssetsHash() => r'e9011e41cc48ea24127626c6e439e5dcc8f97f36';

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

String _$fetchAssetHistoryHash() => r'1d6fd5a99f208ea154d0868781dd53418c96d20c';
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

String _$fetchBinancePairsHash() => r'4c4e810468c169f8902b204069ac15dc4168acb7';

/// See also [fetchBinancePairs].
@ProviderFor(fetchBinancePairs)
final fetchBinancePairsProvider =
    AutoDisposeFutureProvider<List<CryptoBinancePair>>.internal(
  fetchBinancePairs,
  name: r'fetchBinancePairsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchBinancePairsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchBinancePairsRef
    = AutoDisposeFutureProviderRef<List<CryptoBinancePair>>;
String _$fetchBinancePairsByBaseSymbolHash() =>
    r'45979ef924b9f2088cd333c426b464cd480d9daa';
typedef FetchBinancePairsByBaseSymbolRef
    = AutoDisposeFutureProviderRef<List<CryptoBinancePair>>;

/// See also [fetchBinancePairsByBaseSymbol].
@ProviderFor(fetchBinancePairsByBaseSymbol)
const fetchBinancePairsByBaseSymbolProvider =
    FetchBinancePairsByBaseSymbolFamily();

/// See also [fetchBinancePairsByBaseSymbol].
class FetchBinancePairsByBaseSymbolFamily
    extends Family<AsyncValue<List<CryptoBinancePair>>> {
  /// See also [fetchBinancePairsByBaseSymbol].
  const FetchBinancePairsByBaseSymbolFamily();

  /// See also [fetchBinancePairsByBaseSymbol].
  FetchBinancePairsByBaseSymbolProvider call(
    String baseSymbol,
  ) {
    return FetchBinancePairsByBaseSymbolProvider(
      baseSymbol,
    );
  }

  @override
  FetchBinancePairsByBaseSymbolProvider getProviderOverride(
    covariant FetchBinancePairsByBaseSymbolProvider provider,
  ) {
    return call(
      provider.baseSymbol,
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
  String? get name => r'fetchBinancePairsByBaseSymbolProvider';
}

/// See also [fetchBinancePairsByBaseSymbol].
class FetchBinancePairsByBaseSymbolProvider
    extends AutoDisposeFutureProvider<List<CryptoBinancePair>> {
  /// See also [fetchBinancePairsByBaseSymbol].
  FetchBinancePairsByBaseSymbolProvider(
    this.baseSymbol,
  ) : super.internal(
          (ref) => fetchBinancePairsByBaseSymbol(
            ref,
            baseSymbol,
          ),
          from: fetchBinancePairsByBaseSymbolProvider,
          name: r'fetchBinancePairsByBaseSymbolProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchBinancePairsByBaseSymbolHash,
          dependencies: FetchBinancePairsByBaseSymbolFamily._dependencies,
          allTransitiveDependencies:
              FetchBinancePairsByBaseSymbolFamily._allTransitiveDependencies,
        );

  final String baseSymbol;

  @override
  bool operator ==(Object other) {
    return other is FetchBinancePairsByBaseSymbolProvider &&
        other.baseSymbol == baseSymbol;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, baseSymbol.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchCandlesHash() => r'3fbc25c2a3e80fefcce3f16fd8804b6a034d5d04';
typedef FetchCandlesRef = AutoDisposeFutureProviderRef<List<CryptoCandle>>;

/// See also [fetchCandles].
@ProviderFor(fetchCandles)
const fetchCandlesProvider = FetchCandlesFamily();

/// See also [fetchCandles].
class FetchCandlesFamily extends Family<AsyncValue<List<CryptoCandle>>> {
  /// See also [fetchCandles].
  const FetchCandlesFamily();

  /// See also [fetchCandles].
  FetchCandlesProvider call({
    required String symbol,
    String interval = '1m',
  }) {
    return FetchCandlesProvider(
      symbol: symbol,
      interval: interval,
    );
  }

  @override
  FetchCandlesProvider getProviderOverride(
    covariant FetchCandlesProvider provider,
  ) {
    return call(
      symbol: provider.symbol,
      interval: provider.interval,
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
  String? get name => r'fetchCandlesProvider';
}

/// See also [fetchCandles].
class FetchCandlesProvider
    extends AutoDisposeFutureProvider<List<CryptoCandle>> {
  /// See also [fetchCandles].
  FetchCandlesProvider({
    required this.symbol,
    this.interval = '1m',
  }) : super.internal(
          (ref) => fetchCandles(
            ref,
            symbol: symbol,
            interval: interval,
          ),
          from: fetchCandlesProvider,
          name: r'fetchCandlesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCandlesHash,
          dependencies: FetchCandlesFamily._dependencies,
          allTransitiveDependencies:
              FetchCandlesFamily._allTransitiveDependencies,
        );

  final String symbol;
  final String interval;

  @override
  bool operator ==(Object other) {
    return other is FetchCandlesProvider &&
        other.symbol == symbol &&
        other.interval == interval;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, symbol.hashCode);
    hash = _SystemHash.combine(hash, interval.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchOrderBookHash() => r'ddf885e31a0e95ed913f24385273769ab614f5c0';
typedef FetchOrderBookRef = AutoDisposeFutureProviderRef<CryptoOrder>;

/// See also [fetchOrderBook].
@ProviderFor(fetchOrderBook)
const fetchOrderBookProvider = FetchOrderBookFamily();

/// See also [fetchOrderBook].
class FetchOrderBookFamily extends Family<AsyncValue<CryptoOrder>> {
  /// See also [fetchOrderBook].
  const FetchOrderBookFamily();

  /// See also [fetchOrderBook].
  FetchOrderBookProvider call(
    String symbol,
  ) {
    return FetchOrderBookProvider(
      symbol,
    );
  }

  @override
  FetchOrderBookProvider getProviderOverride(
    covariant FetchOrderBookProvider provider,
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
  String? get name => r'fetchOrderBookProvider';
}

/// See also [fetchOrderBook].
class FetchOrderBookProvider extends AutoDisposeFutureProvider<CryptoOrder> {
  /// See also [fetchOrderBook].
  FetchOrderBookProvider(
    this.symbol,
  ) : super.internal(
          (ref) => fetchOrderBook(
            ref,
            symbol,
          ),
          from: fetchOrderBookProvider,
          name: r'fetchOrderBookProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchOrderBookHash,
          dependencies: FetchOrderBookFamily._dependencies,
          allTransitiveDependencies:
              FetchOrderBookFamily._allTransitiveDependencies,
        );

  final String symbol;

  @override
  bool operator ==(Object other) {
    return other is FetchOrderBookProvider && other.symbol == symbol;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, symbol.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$cryptoPairSelectionHash() =>
    r'4cfaa3cbcd99f3f744ad4816ab4fe7f4c03036fd';

abstract class _$CryptoPairSelection
    extends BuildlessAutoDisposeNotifier<CryptoBinancePair?> {
  late final String symbol;

  CryptoBinancePair? build(
    String symbol,
  );
}

/// See also [CryptoPairSelection].
@ProviderFor(CryptoPairSelection)
const cryptoPairSelectionProvider = CryptoPairSelectionFamily();

/// See also [CryptoPairSelection].
class CryptoPairSelectionFamily extends Family<CryptoBinancePair?> {
  /// See also [CryptoPairSelection].
  const CryptoPairSelectionFamily();

  /// See also [CryptoPairSelection].
  CryptoPairSelectionProvider call(
    String symbol,
  ) {
    return CryptoPairSelectionProvider(
      symbol,
    );
  }

  @override
  CryptoPairSelectionProvider getProviderOverride(
    covariant CryptoPairSelectionProvider provider,
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
  String? get name => r'cryptoPairSelectionProvider';
}

/// See also [CryptoPairSelection].
class CryptoPairSelectionProvider extends AutoDisposeNotifierProviderImpl<
    CryptoPairSelection, CryptoBinancePair?> {
  /// See also [CryptoPairSelection].
  CryptoPairSelectionProvider(
    this.symbol,
  ) : super.internal(
          () => CryptoPairSelection()..symbol = symbol,
          from: cryptoPairSelectionProvider,
          name: r'cryptoPairSelectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cryptoPairSelectionHash,
          dependencies: CryptoPairSelectionFamily._dependencies,
          allTransitiveDependencies:
              CryptoPairSelectionFamily._allTransitiveDependencies,
        );

  final String symbol;

  @override
  bool operator ==(Object other) {
    return other is CryptoPairSelectionProvider && other.symbol == symbol;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, symbol.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  CryptoBinancePair? runNotifierBuild(
    covariant CryptoPairSelection notifier,
  ) {
    return notifier.build(
      symbol,
    );
  }
}

String _$cryptoPriceOrCandleSelectionHash() =>
    r'eee3d379a04dacc98d88c656e21e721fc9c23be1';

/// See also [CryptoPriceOrCandleSelection].
@ProviderFor(CryptoPriceOrCandleSelection)
final cryptoPriceOrCandleSelectionProvider = AutoDisposeNotifierProvider<
    CryptoPriceOrCandleSelection, PriceCandleState>.internal(
  CryptoPriceOrCandleSelection.new,
  name: r'cryptoPriceOrCandleSelectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cryptoPriceOrCandleSelectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CryptoPriceOrCandleSelection = AutoDisposeNotifier<PriceCandleState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
