enum DefaultImageSize {
  large._('large'),
  fit._('fit'),
  fitv._('fitv'),
  original._('original');

  final String _value;

  const DefaultImageSize._(this._value);

  @override
  String toString() => _value;

  factory DefaultImageSize.fromString(final String value) =>
      DefaultImageSize.values.firstWhere((element) => element._value == value,
          orElse: () =>
              throw ArgumentError.value(value, 'value', 'Invalid value'));
}
