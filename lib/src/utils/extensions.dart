import 'package:fpdart/fpdart.dart';

import '../constants/data_exception.dart';
import 'number_formatter.dart';

extension Intersperse<T> on Iterable<T> {
  Iterable<T> intersperse(T separator) sync* {
    var iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield separator;
        yield iterator.current;
      }
    }
  }
}

extension NullableFunction<R, T> on R Function(T)? {
  R? nullable(T? value) => (value == null || this == null) ? null : this!(value);
}

extension NullableExtensions<R, T> on T? {
  R? apply(R Function(T) f) => this == null ? null : f(this as T);
  R? applyNullable(R? Function(T) f) => this == null ? null : f(this as T);
}

extension NumberFomatted on num? {
  String get asCompactCurrency => this == null ? '' : compactCurrency.format(this);
  String get asCompact => this == null ? '' : compact.format(this);
  String get asCryptoCurrency => this == null ? '' : cryptoCurrency(this).format(this);
  String get asDecimal => this == null ? '' : decimal.format(this);
  String get asCryptoDecimal => this == null ? '' : cryptoDecimalFormat(this);
  String get asPercentage => this == null ? '' : '${this!.toStringAsFixed(2)}%';
}

extension TaskEitherUnwrap<R> on TaskEither<DataException, R> {
  Future<R> unwrap() async => (await run()).match(
        (l) {
          print('${l.message}\n${l.stackTrace}');
          return Future.error(l.message, l.stackTrace);
        },
        (r) => r,
      );
}

extension NumDateTime on num {
  DateTime get asDateTime => DateTime.fromMillisecondsSinceEpoch(toInt());
}
