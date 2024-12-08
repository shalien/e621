enum Rating {
  s._('s'),
  q._('questionable'),
  e._('explicit');

  final String _value;

  const Rating._(this._value);

  @override
  String toString() => _value;

  factory Rating.fromString(final String value) => Rating.values.firstWhere(
      (final Rating e) => e._value == value.toLowerCase(),
      orElse: () => throw ArgumentError.value(value, 'value', 'invalid value'));
}
