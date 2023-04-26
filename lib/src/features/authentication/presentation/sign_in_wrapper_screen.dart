import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/app_router.dart';
import 'sign_in_form.dart';

part 'sign_in_wrapper_screen.g.dart';

enum SignState {
  signIn,
  signUp,
}

// class AppBarTitle extends HookWidget {
//   const AppBarTitle({
//     Key? key,
//     required this.onChange,
//   }) : super(key: key);
//
//   final String Function() onChange;
//
//   @override
//   Widget build(BuildContext context) {
//     final title = useState('Sign in');
//     return ;
//   }
// }
// @riverpod
// String title(TitleRef ref) {
//   return 'Sign in';
// }

final titleProvider = StateProvider<String>((ref) {
  return 'Sign in';
});

@cwidget
Widget appBarTitle(WidgetRef ref) {
  final title = ref.watch(titleProvider);
  return AppBar(
    title: Text(title),
  );
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
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarTitle(),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          scrollDirection: Axis.horizontal,
          // onPageChanged: (page) => appBarTitle.value = page == 0 ? 'Sign in' : 'Sign up',
          onPageChanged: (page) {
            ref.read(titleProvider.notifier).state = page == 0 ? 'Sign in' : 'Sign up';
          },
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
