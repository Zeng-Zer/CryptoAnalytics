// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCryptoIdentifiersHash() =>
    r'186bb2494b85c66cc7c2e0fc283795f62dec8054';

/// See also [fetchCryptoIdentifiers].
@ProviderFor(fetchCryptoIdentifiers)
final fetchCryptoIdentifiersProvider =
    FutureProvider<List<CryptoIdentifier>>.internal(
  fetchCryptoIdentifiers,
  name: r'fetchCryptoIdentifiersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchCryptoIdentifiersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchCryptoIdentifiersRef = FutureProviderRef<List<CryptoIdentifier>>;
String _$fetchCryptoRateIdentifiersHash() =>
    r'e5827b8f15ee3eb8733294a3187e071ccc00d0a9';

/// See also [fetchCryptoRateIdentifiers].
@ProviderFor(fetchCryptoRateIdentifiers)
final fetchCryptoRateIdentifiersProvider =
    FutureProvider<List<CryptoIdentifier>>.internal(
  fetchCryptoRateIdentifiers,
  name: r'fetchCryptoRateIdentifiersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchCryptoRateIdentifiersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchCryptoRateIdentifiersRef
    = FutureProviderRef<List<CryptoIdentifier>>;
String _$fetchIdSymbolsMapHash() => r'ff0b674bf853bddfda0098af1d65478fb583b06e';

/// See also [fetchIdSymbolsMap].
@ProviderFor(fetchIdSymbolsMap)
final fetchIdSymbolsMapProvider =
    FutureProvider<Map<String, CryptoIdentifier>>.internal(
  fetchIdSymbolsMap,
  name: r'fetchIdSymbolsMapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchIdSymbolsMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchIdSymbolsMapRef = FutureProviderRef<Map<String, CryptoIdentifier>>;
String _$searchAssetsHash() => r'6e6bef0846f71b07f1ae9fd79853ce4679154e5b';

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

typedef SearchAssetsRef = AutoDisposeFutureProviderRef<List<CryptoAsset>>;

/// See also [searchAssets].
@ProviderFor(searchAssets)
const searchAssetsProvider = SearchAssetsFamily();

/// See also [searchAssets].
class SearchAssetsFamily extends Family<AsyncValue<List<CryptoAsset>>> {
  /// See also [searchAssets].
  const SearchAssetsFamily();

  /// See also [searchAssets].
  SearchAssetsProvider call({
    String? search,
    int limit = 100,
    int offset = 0,
  }) {
    return SearchAssetsProvider(
      search: search,
      limit: limit,
      offset: offset,
    );
  }

  @override
  SearchAssetsProvider getProviderOverride(
    covariant SearchAssetsProvider provider,
  ) {
    return call(
      search: provider.search,
      limit: provider.limit,
      offset: provider.offset,
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
  String? get name => r'searchAssetsProvider';
}

/// See also [searchAssets].
class SearchAssetsProvider
    extends AutoDisposeFutureProvider<List<CryptoAsset>> {
  /// See also [searchAssets].
  SearchAssetsProvider({
    this.search,
    this.limit = 100,
    this.offset = 0,
  }) : super.internal(
          (ref) => searchAssets(
            ref,
            search: search,
            limit: limit,
            offset: offset,
          ),
          from: searchAssetsProvider,
          name: r'searchAssetsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchAssetsHash,
          dependencies: SearchAssetsFamily._dependencies,
          allTransitiveDependencies:
              SearchAssetsFamily._allTransitiveDependencies,
        );

  final String? search;
  final int limit;
  final int offset;

  @override
  bool operator ==(Object other) {
    return other is SearchAssetsProvider &&
        other.search == search &&
        other.limit == limit &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchLogoHash() => r'01073842b46a86ead3245507cc3caa3995b4943c';
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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
