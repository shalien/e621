enum Order {
  asc._('id_asc'),
  desc._('id_desc'),
  sticky._('sticky');

  final String _value;

  const Order._(this._value);

  @override
  String toString() => _value;

  factory Order.fromString(final String value) => Order.values.firstWhere(
      (final Order e) => e._value == value.toLowerCase(),
      orElse: () => throw ArgumentError.value(value, 'value', 'invalid value'));
}
