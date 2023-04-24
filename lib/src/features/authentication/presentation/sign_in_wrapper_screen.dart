import 'package:auto_route/annotations.dart';
import 'package:crypto_analytics/src/features/authentication/presentation/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/app_router.dart';
import 'sign_up_form.dart';

// enum SignInState {
//   signIn,
//   signUp,
// }

@RoutePage()
class SignInWrapperScreen extends HookConsumerWidget {
  const SignInWrapperScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final pageController = usePageController();

    final forms = [
      SignInForm(
        key: UniqueKey(),
        onSuccess: () => appRouter.replace(const HomeRoute()),
        onSignUp: () {
          pageController.nextPage(
              duration: const Duration(milliseconds: 340), curve: Curves.easeInOut);
        },
      ),
      SignUpForm(
        key: UniqueKey(),
        onSuccess: () => appRouter.replace(const HomeRoute()),
        onSignIn: () {
          pageController.previousPage(
              duration: const Duration(milliseconds: 340), curve: Curves.easeInOut);
        },
      ),
    ];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign in'),
        ),
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) => forms[index],
        ),
      ),
    );
  }
}
