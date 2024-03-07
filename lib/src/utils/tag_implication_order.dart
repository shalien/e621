/// An enum for the order of tag Implications.
enum TagImplicationOrder {
  status._('status'),
  createdAt._('created_at'),
  updatedAt._('updated_at'),
  name._('name'),
  postCount._('post_count');

  /// The value of the enum.
  final String _value;

  /// Creates a new [TagImplicationOrder].
  const TagImplicationOrder._(this._value);

  @override
  String toString() => _value;
}
