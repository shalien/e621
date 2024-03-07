/// An enum to represent the order of the tags.
enum TagOrder {
  date._('date'),
  count._('count'),
  name._('name');

  /// The value of the enum.
  final String _value;

  /// Creates a new [TagOrder].
  const TagOrder._(this._value);

  @override
  String toString() => _value;
}
