// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authControllerHash() => r'b35b8a3ccc80e7a6463d4fd4cfab23ff1829c9ec';

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

abstract class _$AuthController
    extends BuildlessAutoDisposeAsyncNotifier<UserCredential?> {
  late final SignState? signState;

  FutureOr<UserCredential?> build({
    SignState? signState,
  });
}

/// See also [AuthController].
@ProviderFor(AuthController)
const authControllerProvider = AuthControllerFamily();

/// See also [AuthController].
class AuthControllerFamily extends Family<AsyncValue<UserCredential?>> {
  /// See also [AuthController].
  const AuthControllerFamily();

  /// See also [AuthController].
  AuthControllerProvider call({
    SignState? signState,
  }) {
    return AuthControllerProvider(
      signState: signState,
    );
  }

  @override
  AuthControllerProvider getProviderOverride(
    covariant AuthControllerProvider provider,
  ) {
    return call(
      signState: provider.signState,
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
  String? get name => r'authControllerProvider';
}

/// See also [AuthController].
class AuthControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AuthController, UserCredential?> {
  /// See also [AuthController].
  AuthControllerProvider({
    this.signState,
  }) : super.internal(
          () => AuthController()..signState = signState,
          from: authControllerProvider,
          name: r'authControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$authControllerHash,
          dependencies: AuthControllerFamily._dependencies,
          allTransitiveDependencies:
              AuthControllerFamily._allTransitiveDependencies,
        );

  final SignState? signState;

  @override
  bool operator ==(Object other) {
    return other is AuthControllerProvider && other.signState == signState;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, signState.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<UserCredential?> runNotifierBuild(
    covariant AuthController notifier,
  ) {
    return notifier.build(
      signState: signState,
    );
  }
}

String _$anonymousButtonControllerHash() =>
    r'5d90d20b2e1b9d3aa874d0a412b33aafbf579811';

abstract class _$AnonymousButtonController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final SignState? signState;

  FutureOr<void> build({
    SignState? signState,
  });
}

/// See also [AnonymousButtonController].
@ProviderFor(AnonymousButtonController)
const anonymousButtonControllerProvider = AnonymousButtonControllerFamily();

/// See also [AnonymousButtonController].
class AnonymousButtonControllerFamily extends Family<AsyncValue<void>> {
  /// See also [AnonymousButtonController].
  const AnonymousButtonControllerFamily();

  /// See also [AnonymousButtonController].
  AnonymousButtonControllerProvider call({
    SignState? signState,
  }) {
    return AnonymousButtonControllerProvider(
      signState: signState,
    );
  }

  @override
  AnonymousButtonControllerProvider getProviderOverride(
    covariant AnonymousButtonControllerProvider provider,
  ) {
    return call(
      signState: provider.signState,
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
  String? get name => r'anonymousButtonControllerProvider';
}

/// See also [AnonymousButtonController].
class AnonymousButtonControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AnonymousButtonController,
        void> {
  /// See also [AnonymousButtonController].
  AnonymousButtonControllerProvider({
    this.signState,
  }) : super.internal(
          () => AnonymousButtonController()..signState = signState,
          from: anonymousButtonControllerProvider,
          name: r'anonymousButtonControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$anonymousButtonControllerHash,
          dependencies: AnonymousButtonControllerFamily._dependencies,
          allTransitiveDependencies:
              AnonymousButtonControllerFamily._allTransitiveDependencies,
        );

  final SignState? signState;

  @override
  bool operator ==(Object other) {
    return other is AnonymousButtonControllerProvider &&
        other.signState == signState;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, signState.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<void> runNotifierBuild(
    covariant AnonymousButtonController notifier,
  ) {
    return notifier.build(
      signState: signState,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
