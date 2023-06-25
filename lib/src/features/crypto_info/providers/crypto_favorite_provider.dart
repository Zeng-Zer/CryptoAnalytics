import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/firebase_auth_repository.dart';
import '../../../repositories/firestore_repository.dart';

part 'crypto_favorite_provider.g.dart';

@riverpod
class CryptoFavorite extends _$CryptoFavorite {
  @override
  FutureOr<bool> build(String symbol) {
    final favoriteRepo = ref.watch(firestoreRepositoryProvider);
    final authRepository = ref.watch(firebaseAuthRepositoryProvider);
    final uid = authRepository.auth.currentUser?.uid;
    return favoriteRepo.isFavorite(symbol, uid ?? '');
  }

  Future<void> add() async {
    final favoriteRepo = ref.watch(firestoreRepositoryProvider);
    final authRepository = ref.watch(firebaseAuthRepositoryProvider);
    final uid = authRepository.auth.currentUser?.uid;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => favoriteRepo.addFavorite(symbol, uid ?? '').then((_) => true),
    );
  }

  Future<void> remove() async {
    final favoriteRepo = ref.watch(firestoreRepositoryProvider);
    final authRepository = ref.watch(firebaseAuthRepositoryProvider);
    final uid = authRepository.auth.currentUser?.uid;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => favoriteRepo.removeFavorite(symbol, uid ?? '').then((_) => false),
    );
  }
}

@riverpod
Stream<Set<String>> favorites(FavoritesRef ref) {
  final favoriteRepo = ref.watch(firestoreRepositoryProvider);
  final authRepository = ref.watch(firebaseAuthRepositoryProvider);
  final uid = authRepository.auth.currentUser?.uid;
  return favoriteRepo.favoritesStream(uid ?? '');
}
