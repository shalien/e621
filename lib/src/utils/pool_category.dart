/// The category of a pool.
enum PoolCategory {
  series._('series'),
  collection._('collection');

  /// The value of the category.
  final String _value;

  /// Creates a new [PoolCategory].
  const PoolCategory._(this._value);

  @override
  String toString() => _value;
}
