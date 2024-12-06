enum Status {
  approved._('approved'),
  pending._('pending'),
  rejected._('rejected');

  final String _value;

  const Status._(this._value);

  @override
  String toString() => _value;

  factory Status.fromString(final String value) => Status.values.firstWhere(
      (e) => e._value == value,
      orElse: () => throw ArgumentError.value(value, 'value', 'Invalid value'));
}
