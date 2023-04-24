// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authControllerHash() => r'2d3391fd77573c36ee8004aa872d84e536579df7';

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
  late final SignInState? signInState;

  FutureOr<UserCredential?> build({
    SignInState? signInState,
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
    SignInState? signInState,
  }) {
    return AuthControllerProvider(
      signInState: signInState,
    );
  }

  @override
  AuthControllerProvider getProviderOverride(
    covariant AuthControllerProvider provider,
  ) {
    return call(
      signInState: provider.signInState,
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
    this.signInState,
  }) : super.internal(
          () => AuthController()..signInState = signInState,
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

  final SignInState? signInState;

  @override
  bool operator ==(Object other) {
    return other is AuthControllerProvider && other.signInState == signInState;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, signInState.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<UserCredential?> runNotifierBuild(
    covariant AuthController notifier,
  ) {
    return notifier.build(
      signInState: signInState,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
