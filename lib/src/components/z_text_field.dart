import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../theme.dart';

enum ZTextFieldStyle { outlined, filled }

class ZTextField extends HookWidget {
  const ZTextField({
    super.key,
    this.label,
    this.hint,
    this.helper,
    this.controller,
    this.focusNode,
    this.validator,
    this.keyboardType,
    this.autovalidateMode,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
    this.obscureText = false,
    this.textFieldStyle = ZTextFieldStyle.outlined,
  });

  final String? label;
  final String? hint;
  final String? helper;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final bool isPassword;
  final bool obscureText;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final ZTextFieldStyle textFieldStyle;

  InputBorder createBorder({required BorderSide borderSide, required BorderRadius borderRadius}) {
    if (textFieldStyle == ZTextFieldStyle.outlined) {
      return OutlineInputBorder(borderRadius: borderRadius, borderSide: borderSide);
    }
    return UnderlineInputBorder(borderRadius: borderRadius, borderSide: borderSide);
  }

  @override
  Widget build(BuildContext context) {
    final shouldObscure = useState(obscureText);
    final isTextEmpty = useState(true);
    return TextFormField(
      onChanged: (text) {
        isTextEmpty.value = text.isEmpty;
        shouldObscure.value = isTextEmpty.value && isPassword ? true : shouldObscure.value;
      },
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: createBorder(
          borderSide: BorderSide(color: blueGrey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: createBorder(
          borderSide: BorderSide(color: theme().primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: createBorder(
          borderSide: BorderSide(color: theme().colorScheme.error),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: createBorder(
          borderSide: BorderSide(color: theme().colorScheme.error),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        helperText: helper,
        helperStyle: textTheme().bodySmall?.copyWith(height: 0.2, color: blueGrey.shade400),
        errorText: helper,
        errorStyle: textTheme().labelSmall?.copyWith(height: 0.2, color: theme().colorScheme.error),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14, color: blueGrey.shade400),
        isDense: true,
        suffixIcon: isPassword
            ? IconButton(
                onPressed:
                    isTextEmpty.value ? null : () => shouldObscure.value = !shouldObscure.value,
                icon: shouldObscure.value
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : null,
      ),
      style: textTheme().bodyMedium,
      textAlignVertical: TextAlignVertical.center,
      focusNode: focusNode,
      textInputAction: textInputAction,
      obscureText: shouldObscure.value,
      validator: validator,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
    );
  }
}
