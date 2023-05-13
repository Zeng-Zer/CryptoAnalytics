import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AsyncValueExtension<T> on AsyncValue<T> {
  AsyncValue<T> remap({
    AsyncValue<T> Function(AsyncData<T> data)? data,
    AsyncValue<T> Function(AsyncError<T> error)? error,
    AsyncValue<T> Function(AsyncLoading<T> loading)? loading,
  }) {
    return map(
      data: (d) => (data != null) ? data(d) : d,
      loading: (l) => (loading != null) ? loading(l) : l,
      error: (e) => (error != null) ? error(e) : e,
    );
  }
}
