// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthRepositoryHash() =>
    r'dc4adaef041663d665b9caa645b087782a5570d5';

/// See also [firebaseAuthRepository].
@ProviderFor(firebaseAuthRepository)
final firebaseAuthRepositoryProvider =
    Provider<FirebaseAuthRepository>.internal(
  firebaseAuthRepository,
  name: r'firebaseAuthRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthRepositoryRef = ProviderRef<FirebaseAuthRepository>;
String _$firebaseAuthStateChangesHash() =>
    r'9d398e1c9af6c8e793d7d435b65dbd7b9f89ec82';

/// See also [firebaseAuthStateChanges].
@ProviderFor(firebaseAuthStateChanges)
final firebaseAuthStateChangesProvider =
    AutoDisposeStreamProvider<User?>.internal(
  firebaseAuthStateChanges,
  name: r'firebaseAuthStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthStateChangesRef = AutoDisposeStreamProviderRef<User?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
