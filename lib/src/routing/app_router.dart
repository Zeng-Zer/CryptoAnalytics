import 'package:auto_route/auto_route.dart';
import 'package:crypto_analytics/src/features/authentication/presentation/sign_in_wrapper_screen.dart';
import 'package:crypto_analytics/src/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'app_router.gr.dart';

// TODO PROVIDer
final navigatorKey = GlobalKey<NavigatorState>();

enum AppRoute { signIn }

final appRouterProvider = Provider((ref) => AppRouter(ref: ref));

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({required this.ref}) : super(navigatorKey: navigatorKey);

  final Ref ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SignInWrapperRoute.page),
      ];
}
