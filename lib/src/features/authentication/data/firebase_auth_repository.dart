import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this.auth);

  final FirebaseAuth auth;

  Stream<User?> authStateChanges() => auth.authStateChanges();
  User? get currentUser => auth.currentUser;
  bool get isSignedIn => auth.currentUser != null;

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signInAnonymously() {
    return auth.signInAnonymously();
  }

  Future<void> signOut() {
    return auth.signOut();
  }
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(firebaseAuthProvider));
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
}
