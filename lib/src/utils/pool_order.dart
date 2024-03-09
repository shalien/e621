/// Enum for pool order
enum PoolOrder {
  name._('name'),
  createdAt._('created_at'),
  updatedAt._('updated_at'),
  postCount._('post_count');

  final String _value;

  const PoolOrder._(this._value);

  @override
  String toString() => _value;
}
