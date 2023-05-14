import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/authentication/presentation/sign_in_wrapper_screen.dart';
import '../features/charts/charts_screen.dart';
import '../features/crypto_info/presentation/crypto_screen.dart';
import '../features/crypto_list/domain/crypto_asset.dart';
import '../features/crypto_list/presentation/home_screen.dart';
import '../features/profile/profile_screen.dart';
import 'bottom_app_bar_holder_screen.dart';

part 'app_router.gr.dart';

final navigatorKey = GlobalKey<NavigatorState>();

enum AppRoute { signIn }

final appRouterProvider = Provider((ref) => AppRouter(ref: ref));

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({required this.ref}) : super(navigatorKey: navigatorKey);

  final Ref ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BottomAppBarHolderRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ChartsRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: SignInWrapperRoute.page),
        CustomRoute(page: CryptoRoute.page, transitionsBuilder: TransitionsBuilders.slideLeft),
      ];
}
