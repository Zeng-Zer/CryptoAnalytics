// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authControllerHash() => r'a552fc75c10622d447874b8d60d7747de969660f';

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
