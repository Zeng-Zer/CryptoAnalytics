// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChartsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChartsScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    SignInWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInWrapperScreen(),
      );
    },
    BottomAppBarHolderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomAppBarHolderScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    CryptoRoute.name: (routeData) {
      final args = routeData.argsAs<CryptoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CryptoScreen(
          key: args.key,
          asset: args.asset,
        ),
      );
    },
  };
}

/// generated route for
/// [ChartsScreen]
class ChartsRoute extends PageRouteInfo<void> {
  const ChartsRoute({List<PageRouteInfo>? children})
      : super(
          ChartsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChartsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInWrapperScreen]
class SignInWrapperRoute extends PageRouteInfo<void> {
  const SignInWrapperRoute({List<PageRouteInfo>? children})
      : super(
          SignInWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BottomAppBarHolderScreen]
class BottomAppBarHolderRoute extends PageRouteInfo<void> {
  const BottomAppBarHolderRoute({List<PageRouteInfo>? children})
      : super(
          BottomAppBarHolderRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomAppBarHolderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CryptoScreen]
class CryptoRoute extends PageRouteInfo<CryptoRouteArgs> {
  CryptoRoute({
    Key? key,
    required CryptoAsset asset,
    List<PageRouteInfo>? children,
  }) : super(
          CryptoRoute.name,
          args: CryptoRouteArgs(
            key: key,
            asset: asset,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoRoute';

  static const PageInfo<CryptoRouteArgs> page = PageInfo<CryptoRouteArgs>(name);
}

class CryptoRouteArgs {
  const CryptoRouteArgs({
    this.key,
    required this.asset,
  });

  final Key? key;

  final CryptoAsset asset;

  @override
  String toString() {
    return 'CryptoRouteArgs{key: $key, asset: $asset}';
  }
}
