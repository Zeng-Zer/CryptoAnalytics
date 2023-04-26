import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/firebase_auth_repository.dart';
import 'sign_in_wrapper_screen.dart';

part 'firebase_auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<UserCredential?> build({SignState? signState}) {
    return null;
  }

  Future<bool> signInWithEmailAndPassword({required String email, required String password}) async {
    final authRepo = ref.watch(authRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );

    return state.value != null;
  }

  Future<bool> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    final authRepo = ref.watch(authRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authRepo.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );

    return state.value != null;
  }
}

@riverpod
class AnonymousButtonController extends _$AnonymousButtonController {
  @override
  FutureOr<void> build({SignState? signState}) async {}

  Future<void> signInAnonymously() async {
    final authRepo = ref.watch(authRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepo.signInAnonymously());
  }
}
