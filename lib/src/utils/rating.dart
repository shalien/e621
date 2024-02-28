/// Represents the rating of a post.
final class Rating {
  /// The value of the rating.
  final String _value;

  /// Creates a new [Rating].
  const Rating._(this._value);

  /// The safe rating.
  static const Rating safe = Rating._('s');

  /// The questionable rating.
  static const Rating questionable = Rating._('q');

  /// The explicit rating.
  static const Rating explicit = Rating._('e');

  @override
  String toString() => _value;
}
