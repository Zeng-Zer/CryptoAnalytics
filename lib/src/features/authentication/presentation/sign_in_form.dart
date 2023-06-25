import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/text_divider.dart';
import '../../../components/z_text_field.dart';
import '../../../theme.dart';
import '../providers/firebase_auth_controller.dart';
import '../utils/validators.dart';
import 'sign_in_wrapper_screen.dart';

class SignForm extends HookConsumerWidget {
  const SignForm({
    Key? key,
    required this.onSuccess,
    required this.onSignStateChange,
    required this.signState,
  }) : super(key: key);

  final void Function() onSuccess;
  final void Function() onSignStateChange;
  final SignState signState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();
    final formKey = useMemoized(GlobalKey<FormState>.new, [signState]);

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final nameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    final touched = useState(false);
    final autovalidateMode = touched.value ? AutovalidateMode.onUserInteraction : null;

    unfocus() {
      emailFocusNode.unfocus();
      passwordFocusNode.unfocus();
      nameFocusNode.unfocus();
    }

    buildNameTextField() {
      if (signState == SignState.signIn) return [];
      return [
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
      ];
    }

    buildEmailAndPasswordTextField() {
      return [
        ZTextField(
          label: 'Email',
          hint: 'toto@google.com',
          controller: emailController,
          focusNode: emailFocusNode,
          validator: emailValidator,
          autovalidateMode: autovalidateMode,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 16),
        ZTextField(
          label: 'Password',
          hint: '8 characters minimum',
          controller: passwordController,
          focusNode: passwordFocusNode,
          isPassword: true,
          obscureText: true,
          validator: passwordValidator,
          autovalidateMode: autovalidateMode,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 16),
      ];
    }

    buildSubmitButton() {
      final authCtrlProvider = authControllerProvider(signState: signState);
      final authController = ref.watch(authCtrlProvider);
      final submitLabel = signState == SignState.signIn ? 'Login' : 'Sign up';

      signUpOrIn(String email, String password) {
        final notifier = ref.read(authCtrlProvider.notifier);
        return signState == SignState.signIn
            ? notifier.signInWithEmailAndPassword(email: email, password: password)
            : notifier.createUserWithEmailAndPassword(email: email, password: password);
      }

      onPressed() async {
        if (formKey.currentState!.validate()) {
          unfocus();
          final signedIn = await signUpOrIn(emailController.text.trim(), passwordController.text);
          if (signedIn) onSuccess();
        }
        touched.value = true;
      }

      return [
        FilledButton(
          onPressed: (authController.isLoading) ? null : onPressed,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
          ),
          child: Center(
            child: authController.map(
              data: (_) => Text(submitLabel, textAlign: TextAlign.center),
              error: (e) => Text(submitLabel, textAlign: TextAlign.center),
              loading: (_) =>
                  const SizedBox(height: 20, width: 20, child: CircularProgressIndicator()),
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (authController.hasError) ...[
          Text(
            authController.error.toString(),
            style: textTheme().bodySmall?.copyWith(color: theme().colorScheme.error),
          ),
          const SizedBox(height: 8),
        ]
      ];
    }

    buildOAuthButtons() {
      final ctrlProvider = anonymousButtonControllerProvider(signState: signState);
      final ctrl = ref.watch(ctrlProvider);
      final notifier = ref.read(ctrlProvider.notifier);

      return [
        FilledButton(
          onPressed: () {
            unfocus();
          },
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            backgroundColor: theme().buttonTheme.colorScheme?.secondary,
          ),
          child: const Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.facebook),
                SizedBox(width: 16),
                Text('Continue with Facebook'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () async {
            unfocus();
            await notifier.signInAnonymously();
            onSuccess();
          },
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            // backgroundColor: theme().buttonTheme.colorScheme?.secondary,
          ),
          child: Center(
            child: ctrl.map(
              data: (data) => const Text('Continue anonymously'),
              error: (err) => const Text('Continue anonymously'),
              loading: (_) =>
                  const SizedBox(height: 20, width: 20, child: CircularProgressIndicator()),
            ),
            // child: Text('Continue anonymously'),
          ),
        ),
        const SizedBox(height: 8),
      ];
    }

    buildAlreadyAccount() {
      final alreadyAccountText = signState == SignState.signIn
          ? 'Don\'t have an account ? '
          : 'Already have an account ? ';
      final signText = signState == SignState.signIn ? 'Sign Up' : 'Sign In';

      return Center(
        child: RichText(
          text: TextSpan(
            text: alreadyAccountText,
            style: textTheme().bodyMedium?.copyWith(color: Colors.black),
            children: [
              TextSpan(
                text: signText,
                style: textTheme().bodyMedium?.copyWith(color: Colors.lightBlueAccent),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    unfocus();
                    onSignStateChange();
                  },
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ...buildNameTextField(),
              ...buildEmailAndPasswordTextField(),
              ...buildSubmitButton(),
              const TextDivider(text: 'or', innerPadding: 8, outerPadding: 8),
              const SizedBox(height: 8),
              ...buildOAuthButtons(),
              buildAlreadyAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
