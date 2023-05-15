import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_repository.g.dart';

class FirebaseAuthRepository {
  FirebaseAuthRepository(this.auth);

  final FirebaseAuth auth;

  User? get currentUser => auth.currentUser;
  bool get isSignedIn => auth.currentUser != null;

  Stream<User?> authStateChanges() => auth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      auth.signInWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      auth.createUserWithEmailAndPassword(email: email, password: password);

  Future<void> signInAnonymously() => auth.signInAnonymously();

  Future<void> signOut() => auth.signOut();
}

@Riverpod(keepAlive: true)
FirebaseAuthRepository firebaseAuthRepository(FirebaseAuthRepositoryRef ref) {
  return FirebaseAuthRepository(FirebaseAuth.instance);
}

@riverpod
Stream<User?> firebaseAuthStateChanges(FirebaseAuthStateChangesRef ref) {
  return ref.watch(firebaseAuthRepositoryProvider).authStateChanges();
}
