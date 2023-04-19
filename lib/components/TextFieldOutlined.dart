import 'package:flutter/material.dart';

import '../theme.dart';

class TextFieldOutlined extends StatefulWidget {
  const TextFieldOutlined({
    super.key,
    required this.label,
    required this.hint,
    this.helper,
    this.controller,
    this.focusNode,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
    this.obscureText = false,
  });

  final String label;
  final String hint;
  final String? helper;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final bool isPassword;
  final bool obscureText;

  @override
  State<TextFieldOutlined> createState() => _TextFieldOutlined();
}

class _TextFieldOutlined extends State<TextFieldOutlined> {
  late bool obscureText;
  bool isTextEmpty = true;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (text) => setState(() {
        isTextEmpty = text.isEmpty;
        obscureText = isTextEmpty && widget.isPassword ? true : obscureText;
      }),
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blueGrey.shade500),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme().primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: widget.label,
        labelStyle: MaterialStateTextStyle.resolveWith((states) =>
            textTheme().labelLarge!.copyWith(color: colorByStates(states))
        ),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) =>
            textTheme().labelLarge!.copyWith(color: colorByStates(states))
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        helperText: widget.helper,
        errorText: widget.helper,
        helperStyle: textTheme().bodySmall?.copyWith(height: 0.2, color: blueGrey.shade400),
        hintText: widget.hint,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        isDense: true,
        // contentPadding: const EdgeInsets.fromLTRB(4, 14, 24, 4),
        suffixIcon: widget.isPassword ? IconButton(
          onPressed: isTextEmpty ? null : () => setState(() => obscureText = !obscureText),
          icon: obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ) : null,
      ),
      style: const TextStyle(fontSize: 14),
      textAlignVertical: TextAlignVertical.center,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      obscureText: obscureText,
      validator: widget.validator,
    );
  }
}