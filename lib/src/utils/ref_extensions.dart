import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension TimedFetchRef on Ref {
  void refreshAfter(Duration duration) {
    final timer = Timer(duration, () {
      invalidateSelf();
    });

    onDispose(() {
      timer.cancel();
    });
  }
}

extension AutoDisposeExtension on AutoDisposeRef {
  void cacheFor(Duration duration) {
    final keepAliveLink = keepAlive();
    final timer = Timer(duration, () {
      keepAliveLink.close();
    });

    onDispose(() {
      timer.cancel();
    });
  }
}
