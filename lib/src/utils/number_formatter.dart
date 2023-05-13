import 'dart:math';

import 'package:intl/intl.dart';

final compactCurrency = NumberFormat.compactCurrency(
  decimalDigits: 2,
  symbol: '\$',
);

final compact = NumberFormat.compact();

NumberFormat currencyWithDigit(int digit) => NumberFormat.currency(
      decimalDigits: digit,
      symbol: '\$',
    );

String cryptoDecimalFormat(num? value) {
  if (value == null) return '';
  if (value >= 100000) return value.toStringAsFixed(0);
  if (value >= 100) return value.toStringAsFixed(1);
  if (value >= 10) return value.toStringAsFixed(2);
  if (value >= 1) return value.toStringAsFixed(3);
  if (value == 0) return value.toStringAsFixed(4);

  final firstDigitPosition = log(value) / ln10;
  if (firstDigitPosition.isInfinite) return value.toStringAsFixed(2);
  return value.toStringAsFixed(4 - firstDigitPosition.round());
}

NumberFormat cryptoCurrency(num? value) {
  if (value == null) return currencyWithDigit(2);
  if (value >= 100000) return currencyWithDigit(0);
  if (value >= 100) return currencyWithDigit(1);
  if (value >= 10) return currencyWithDigit(2);
  if (value >= 1) return currencyWithDigit(3);

  final firstDigitPosition = log(value) / ln10;
  if (firstDigitPosition.isInfinite) return currencyWithDigit(2);
  return currencyWithDigit(4 - firstDigitPosition.round());
}

final decimal = NumberFormat.decimalPattern('en_US');
