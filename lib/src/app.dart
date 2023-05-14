import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/crypto_info/providers/crypto_info_provider.dart';
import 'repositories/firebase_auth_repository.dart';
import 'routing/app_router.dart';
import 'theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  void initGlobalFutureProviders(WidgetRef ref) {
    ref.read(fetchIdSymbolsMapProvider);
    ref.read(fetchBinancePairsProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final authRepo = ref.watch(authRepositoryProvider);
    final themeData = ref.watch(themeDataProvider);

    initGlobalFutureProviders(ref);

    return MaterialApp.router(
      theme: themeData,
      routeInformationParser: appRouter.defaultRouteParser(includePrefixMatches: true),
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
        ],
        deepLinkBuilder: (_) =>
            DeepLink([if (authRepo.isSignedIn) const HomeRoute() else const SignInWrapperRoute()]),
      ),
    );
  }
}
