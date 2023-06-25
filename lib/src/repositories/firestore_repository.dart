import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_repository.g.dart';

class FirestoreRepository {
  FirestoreRepository(this.firestore) : favorites = firestore.collection('favorites') {
    firestore.settings = const Settings(persistenceEnabled: true);
  }

  final CollectionReference favorites;

  final FirebaseFirestore firestore;

  Future<void> addFavorite(String symbol, String userId) async {
    await favorites.doc(userId).collection('favorites').doc(symbol).set({'symbol': symbol});
  }

  Future<void> removeFavorite(String symbol, String userId) async {
    await favorites.doc(userId).collection('favorites').doc(symbol).delete();
  }

  Future<bool> isFavorite(String symbol, String userId) async {
    final doc = await favorites.doc(userId).collection('favorites').doc(symbol).get();
    return doc.exists;
  }

  Stream<Set<String>> favoritesStream(String userId) {
    return favorites.doc(userId).collection('favorites').snapshots().map((snapshot) {
      return snapshot.docs.map((e) => e.data()['symbol'] as String).toSet();
    });
  }
}

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
FirestoreRepository firestoreRepository(FirestoreRepositoryRef ref) {
  return FirestoreRepository(ref.watch(firebaseFirestoreProvider));
}
