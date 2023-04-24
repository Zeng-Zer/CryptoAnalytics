import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/app_router.dart';
import 'sign_in_form.dart';

enum SignState {
  signIn,
  signUp,
}

@RoutePage()
class SignInWrapperScreen extends HookConsumerWidget {
  const SignInWrapperScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final pageController = usePageController();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign in'),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            SignForm(
              signState: SignState.signIn,
              onSuccess: () => appRouter.replace(const HomeRoute()),
              onSignStateChange: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 340), curve: Curves.easeInOut);
              },
            ),
            SignForm(
              signState: SignState.signUp,
              onSuccess: () => appRouter.replace(const HomeRoute()),
              onSignStateChange: () {
                pageController.previousPage(
                    duration: const Duration(milliseconds: 340), curve: Curves.easeInOut);
              },
            ),
          ],
        ),
      ),
    );
  }
}
