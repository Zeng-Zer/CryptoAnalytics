// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_favorite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoritesHash() => r'3f77718c995d1c9fc315840b119d08130bc65d9c';

/// See also [favorites].
@ProviderFor(favorites)
final favoritesProvider = AutoDisposeStreamProvider<Set<String>>.internal(
  favorites,
  name: r'favoritesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$favoritesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoritesRef = AutoDisposeStreamProviderRef<Set<String>>;
String _$cryptoFavoriteHash() => r'640bcd3e451e80898ff08a79075fa6ce84f7f938';

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

abstract class _$CryptoFavorite
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final String symbol;

  FutureOr<bool> build(
    String symbol,
  );
}

/// See also [CryptoFavorite].
@ProviderFor(CryptoFavorite)
const cryptoFavoriteProvider = CryptoFavoriteFamily();

/// See also [CryptoFavorite].
class CryptoFavoriteFamily extends Family<AsyncValue<bool>> {
  /// See also [CryptoFavorite].
  const CryptoFavoriteFamily();

  /// See also [CryptoFavorite].
  CryptoFavoriteProvider call(
    String symbol,
  ) {
    return CryptoFavoriteProvider(
      symbol,
    );
  }

  @override
  CryptoFavoriteProvider getProviderOverride(
    covariant CryptoFavoriteProvider provider,
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
  String? get name => r'cryptoFavoriteProvider';
}

/// See also [CryptoFavorite].
class CryptoFavoriteProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CryptoFavorite, bool> {
  /// See also [CryptoFavorite].
  CryptoFavoriteProvider(
    this.symbol,
  ) : super.internal(
          () => CryptoFavorite()..symbol = symbol,
          from: cryptoFavoriteProvider,
          name: r'cryptoFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cryptoFavoriteHash,
          dependencies: CryptoFavoriteFamily._dependencies,
          allTransitiveDependencies:
              CryptoFavoriteFamily._allTransitiveDependencies,
        );

  final String symbol;

  @override
  bool operator ==(Object other) {
    return other is CryptoFavoriteProvider && other.symbol == symbol;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, symbol.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<bool> runNotifierBuild(
    covariant CryptoFavorite notifier,
  ) {
    return notifier.build(
      symbol,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
