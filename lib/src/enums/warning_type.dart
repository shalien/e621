enum WarningType {
  warning._('warning'),
  record._('record'),
  ban._('ban');

  final String _value;

  const WarningType._(this._value);

  @override
  String toString() => _value;

  factory WarningType.fromString(final String value) =>
      WarningType.values.firstWhere((e) => e._value == value.toLowerCase(),
          orElse: () =>
              throw ArgumentError.value(value, 'value', 'Invalid value'));
}
