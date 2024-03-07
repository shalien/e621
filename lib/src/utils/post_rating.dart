
/// Represents the rating of a post.
enum PostRating {
  safe._('s'),
  questionable._('q'),
  explicit._('e');

  /// The value of the rating.
  final String _value;

  /// Creates a new [PostRating].
  const PostRating._(this._value);

  @override
  String toString() => _value;
}
