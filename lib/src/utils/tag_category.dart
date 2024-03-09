/// A [TagCategory] linked to [Tag].
enum TagCategory {
  general._(0),
  artist._(1),
  copyright._(3),
  character._(4),
  species._(5),
  invalid._(6),
  meta._(7),
  lore._(8);

  /// The value of this [TagCategory].
  final int _value;

  /// Creates a new [TagCategory].
  const TagCategory._(this._value);

  @override
  String toString() => _value.toString();
}
