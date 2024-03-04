/// An enum to represent the order of the tags.
final class TagOrder {
  /// The value of the enum.
  final String _value;

  /// Creates a new [TagOrder].
  const TagOrder._(this._value);

  static const TagOrder date = TagOrder._('date');
  static const TagOrder count = TagOrder._('count');
  static const TagOrder name = TagOrder._('name');
}
