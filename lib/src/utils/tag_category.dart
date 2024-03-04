import 'package:meta/meta.dart';

@immutable

/// A [TagCategory] linked to [Tag].
final class TagCategory {
  /// The value of this [TagCategory].
  final int _value;

  /// Creates a new [TagCategory].
  const TagCategory._(this._value);

  /// Converts this [TagCategory] to a value.
  factory TagCategory.fromValue(int value) {
    switch (value) {
      case 0:
        return TagCategory.general;
      case 1:
        return TagCategory.artist;
      case 3:
        return TagCategory.copyright;
      case 4:
        return TagCategory.character;
      case 5:
        return TagCategory.species;
      case 6:
        return TagCategory.invalid;
      case 7:
        return TagCategory.meta;
      case 8:
        return TagCategory.lore;
      default:
        throw ArgumentError.value(value, 'value', 'Invalid tag category');
    }
  }

  static const TagCategory general = TagCategory._(0);
  static const TagCategory artist = TagCategory._(1);
  static const TagCategory copyright = TagCategory._(3);
  static const TagCategory character = TagCategory._(4);
  static const TagCategory species = TagCategory._(5);
  static const TagCategory invalid = TagCategory._(6);
  static const TagCategory meta = TagCategory._(7);
  static const TagCategory lore = TagCategory._(8);
}
