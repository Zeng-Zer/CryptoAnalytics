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
