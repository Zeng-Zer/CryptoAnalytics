import 'dart:math';

import 'package:intl/intl.dart';

final compactCurrency = NumberFormat.compactCurrency(
  decimalDigits: 2,
  symbol: '\$',
);

NumberFormat currencyWithDigit(int digit) => NumberFormat.currency(
      decimalDigits: digit,
      symbol: '\$',
    );

NumberFormat cryptoCurrency(num? value) {
  if (value == null) return currencyWithDigit(2);

  if (value >= 10) {
    return currencyWithDigit(2);
  }

  if (value >= 1) {
    return currencyWithDigit(3);
  }

  final firstDigitPosition = log(value) / ln10;

  return currencyWithDigit(4 - firstDigitPosition.round());
}

final decimal = NumberFormat.decimalPattern('en_US');
