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

extension NullableFunction<R, T> on R Function(T) {
  R? nullable(T? value) => value == null ? null : this(value);
}

extension NullableExtensions<R, T> on T? {
  R? apply(R Function(T) f) => this == null ? null : f(this as T);
  R? applyNullable(R? Function(T) f) => this == null ? null : f(this as T);
}

extension NumberFomatted on num? {
  String get asCompactCurrency => compactCurrency.format(this);
  String get asCryptoCurrency => cryptoCurrency(this).format(this);
  String get asDecimal => decimal.format(this);
  String get asPercentage => this == null ? '' : '${this!.toStringAsFixed(2)}%';
}
