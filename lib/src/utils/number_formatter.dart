import 'package:intl/intl.dart';

final compactCurrency = NumberFormat.compactCurrency(
  decimalDigits: 2,
  symbol: '\$',
);

final currency = NumberFormat.currency(
  decimalDigits: 2,
  symbol: '\$',
);

final decimal = NumberFormat.decimalPattern('en_US');
