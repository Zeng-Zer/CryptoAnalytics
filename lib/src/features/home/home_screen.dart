import 'package:auto_route/auto_route.dart';
import 'package:crypto_analytics/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../routing/app_router.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authRepository = ref.watch(authRepositoryProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: Center(
        child: Column(
          children: [
            Text('Hello world'),
            ElevatedButton(
              onPressed: () async {
                await authRepository.signOut();
                context.router.replaceAll([const SignInWrapperRoute()]);
              },
              child: Text('log out'),
            )
          ],
        ),
      ),
    );
  }
}
