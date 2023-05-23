import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repositories/firebase_auth_repository.dart';
import '../../routing/app_router.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final authRepository = ref.watch(firebaseAuthRepositoryProvider);
    final appRouter = context.router;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Hello world ${authRepository.currentUser?.email}'),
            ElevatedButton(
              onPressed: () async {
                await authRepository.signOut();
                appRouter.replaceAll([const SignInWrapperRoute()]);
              },
              child: const Text('log out'),
            )
          ],
        ),
      ),
    );
  }
}
