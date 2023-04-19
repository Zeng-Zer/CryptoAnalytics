import 'package:flutter/material.dart';

import '../theme.dart';

enum ZTextFieldStyle {
  outlined,
  filled
}

class ZTextField extends StatefulWidget {
  const ZTextField({
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
    this.textFieldStyle = ZTextFieldStyle.outlined,
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
  final ZTextFieldStyle textFieldStyle;

  @override
  State<ZTextField> createState() => _TextFieldOutlined();
}

class _TextFieldOutlined extends State<ZTextField> {
  late bool obscureText;
  bool isTextEmpty = true;

  InputBorder createBorder({
    required BorderSide borderSide,
    required BorderRadius borderRadius
  }) {
    if (widget.textFieldStyle == ZTextFieldStyle.outlined) {
      return OutlineInputBorder(borderRadius: borderRadius, borderSide: borderSide);
    }
    return UnderlineInputBorder(borderRadius: borderRadius, borderSide: borderSide);
  }

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
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        helperText: widget.helper,
        errorText: widget.helper,
        helperStyle: textTheme().bodySmall?.copyWith(height: 0.2, color: blueGrey.shade400),
        hintText: widget.hint,
        hintStyle: TextStyle(fontSize: 14, color: blueGrey.shade400),
        isDense: true,
        // contentPadding: const EdgeInsets.fromLTRB(4, 14, 24, 4),
        suffixIcon: widget.isPassword ? IconButton(
          onPressed: isTextEmpty ? null : () => setState(() => obscureText = !obscureText),
          icon: obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ) : null,
      ),
      style: textTheme().bodyMedium,
      textAlignVertical: TextAlignVertical.center,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      obscureText: obscureText,
      validator: widget.validator,
    );
  }
}