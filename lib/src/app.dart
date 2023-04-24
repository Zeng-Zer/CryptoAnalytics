import 'package:crypto_analytics/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:crypto_analytics/src/routing/app_router.dart';
import 'package:crypto_analytics/src/theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final authRepo = ref.watch(authRepositoryProvider);

    return MaterialApp.router(
      theme: createTheme(),
      routeInformationParser: appRouter.defaultRouteParser(includePrefixMatches: true),
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
        ],
        initialRoutes: [if (authRepo.isSignedIn) const HomeRoute() else const SignInWrapperRoute()],
      ),
    );
  }
}
