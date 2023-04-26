import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';

@RoutePage()
class BottomAppBarHolderScreen extends StatelessWidget {
  const BottomAppBarHolderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ChartsRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => NavigationBar(
        selectedIndex: tabsRouter.activeIndex,
        onDestinationSelected: tabsRouter.setActiveIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'Charts',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
