import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/text_divider.dart';
import '../../../components/z_text_field.dart';
import '../../../theme.dart';
import '../data/firebase_auth_repository.dart';
import '../utils/validators.dart';
import 'firebase_auth_controller.dart';
import 'sign_in_wrapper_screen.dart';

class SignUpForm extends HookConsumerWidget {
  const SignUpForm({
    Key? key,
    required this.onSuccess,
    required this.onSignIn,
  }) : super(key: key);

  final void Function() onSuccess;
  final void Function() onSignIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);

    final authCtrlProvider = authControllerProvider(signInState: SignInState.signUp);
    final authController = ref.watch(authCtrlProvider);
    final authRepo = ref.watch(authRepositoryProvider);

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final nameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    final touched = useState(false);
    final autovalidateMode = touched.value ? AutovalidateMode.onUserInteraction : null;

    unfocus() {
      nameFocusNode.unfocus();
      emailFocusNode.unfocus();
      passwordFocusNode.unfocus();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ZTextField(
                label: 'Name',
                hint: 'David',
                controller: nameController,
                focusNode: nameFocusNode,
                validator: nameValidator,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autovalidateMode: autovalidateMode,
              ),
              const SizedBox(height: 16),
              ZTextField(
                label: 'Email',
                hint: 'toto@google.com',
                controller: emailController,
                focusNode: emailFocusNode,
                validator: emailValidator,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autovalidateMode: autovalidateMode,
              ),
              const SizedBox(height: 16),
              ZTextField(
                label: 'Password',
                hint: '8 characters minimum',
                controller: passwordController,
                focusNode: passwordFocusNode,
                isPassword: true,
                obscureText: true,
                textInputAction: TextInputAction.next,
                validator: passwordValidator,
                autovalidateMode: autovalidateMode,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: (authController.isLoading)
                    ? null
                    : () async {
                        if (formKey.currentState!.validate()) {
                          unfocus();

                          final signedIn = await ref
                              .read(authCtrlProvider.notifier)
                              .createUserWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text,
                              );

                          if (signedIn) {
                            authRepo.currentUser?.updateDisplayName(nameController.text.trim());
                            onSuccess();
                          }
                        }
                        touched.value = true;
                      },
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                  // backgroundColor: MyTheme.get().buttonTheme.colorScheme?.primary,
                ),
                child: Center(
                  child: authController.map(
                    data: (_) => const Text('Register', textAlign: TextAlign.center),
                    error: (e) => Text(e.error.toString()),
                    loading: (_) => const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const TextDivider(text: 'or', innerPadding: 8, outerPadding: 8),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: () {
                  unfocus();
                },
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  backgroundColor: theme().buttonTheme.colorScheme?.secondary,
                ),
                child: Center(
                  child: Row(mainAxisSize: MainAxisSize.min, children: const [
                    Icon(Icons.facebook),
                    SizedBox(width: 16),
                    Text('Continue with Facebook'),
                  ]),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                  child: RichText(
                text: TextSpan(
                    text: 'Already have an account ? ',
                    style: textTheme().bodyMedium?.copyWith(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: textTheme().bodyMedium?.copyWith(color: Colors.lightBlueAccent),
                        recognizer: TapGestureRecognizer()..onTap = onSignIn,
                      )
                    ]),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
