import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme.dart';

class ZSearchBar extends HookConsumerWidget {
  const ZSearchBar({
    Key? key,
    this.controller,
    this.focusNode,
    this.hint = 'Search',
    this.contentPadding = const EdgeInsets.symmetric(vertical: 0),
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hint;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hint,
        hintStyle: textTheme().bodyMedium?.copyWith(color: blueGrey.shade500),
        prefixIcon: Icon(Icons.search, color: blueGrey.shade500),
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(60),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(60),
        ),
      ),
    );
  }
}
