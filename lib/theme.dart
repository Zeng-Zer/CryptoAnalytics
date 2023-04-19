import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final navigatorKey = GlobalKey<NavigatorState>();

ThemeData theme() => Theme.of(navigatorKey.currentState!.overlay!.context);
TextTheme textTheme() => Theme.of(navigatorKey.currentState!.overlay!.context).textTheme;

// hovered,
// focused,
// pressed,
// dragged,
// selected,
// scrolledUnder,
// disabled,
// error,
Color colorByStates(Set<MaterialState> states, { Color? main }) {
  states.forEach(print);
  if (states.contains(MaterialState.disabled)) {
    return blueGrey.shade500.withOpacity(0.38);
  }
  if (states.contains(MaterialState.error)) {
    return Colors.red;
  }
  if (states.contains(MaterialState.focused)) {
    return main ?? theme().colorScheme.primary;
  }
  if (states.contains(MaterialState.hovered)) {
    return blueGrey.shade500;
  }
  return Colors.black;
}

const violet = MaterialColor(
  0xFF8B5CF6,
  <int, Color>{
    50: Color(0xFFF5F3FF),
    100: Color(0xFFEDE9FE),
    200: Color(0xFFDDD6FE),
    300: Color(0xFFC4B5FD),
    400: Color(0xFFA78BFA),
    500: Color(0xFF8B5CF6),
    600: Color(0xFF7C3AED),
    700: Color(0xFF6D28D9),
    800: Color(0xFF5B21B6),
    900: Color(0xfF4C1D95),
  },
);

const blueGrey = MaterialColor(
  0xFF64748B,
  <int, Color>{
    50: Color(0xFFF8FAFC),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE2E8F0),
    300: Color(0xFFCBD5E1),
    400: Color(0xFF94A3B8),
    500: Color(0xFF64748B),
    600: Color(0xFF475569),
    700: Color(0xFF334155),
    800: Color(0xFF1E293B),
    900: Color(0xFF0F172A),
  },
);

TextTheme createTextTheme() {
  final style = GoogleFonts.readexPro();
  return TextTheme(
    displayLarge: style.copyWith(fontWeight: FontWeight.w400, fontSize: 57, letterSpacing: -0.25),
    displayMedium: style.copyWith(fontWeight: FontWeight.w400, fontSize: 45, height: 52),
    displaySmall: style.copyWith(fontWeight: FontWeight.w400, fontSize: 36),
    headlineLarge: style.copyWith(fontWeight: FontWeight.w400, fontSize: 32),
    headlineMedium: style.copyWith(fontWeight: FontWeight.w400, fontSize: 28),
    headlineSmall: style.copyWith(fontWeight: FontWeight.w400, fontSize: 24),
    titleLarge: style.copyWith(fontWeight: FontWeight.w400, fontSize: 22),
    titleMedium: style.copyWith(fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.1),
    titleSmall: style.copyWith(fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 0.1),
    labelLarge: style.copyWith(fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 0.1),
    labelMedium: style.copyWith(fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: 0.5),
    labelSmall: style.copyWith(fontWeight: FontWeight.w500, fontSize: 11, letterSpacing: 0.5),
    bodyLarge: style.copyWith(fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.5),
    bodyMedium: style.copyWith(fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: 0.25),
    bodySmall: style.copyWith(fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: 0.4),
  );
}

ThemeData createTheme() {
  return ThemeData(
    useMaterial3: true,
    primarySwatch: violet,
    textTheme: createTextTheme(),
  );
}
