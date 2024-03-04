import 'package:meta/meta.dart';

@immutable

/// Represents the rating of a post.
final class PostRating {
  /// The value of the rating.
  final String _value;

  /// Creates a new [PostRating].
  const PostRating._(this._value);

  /// The safe rating.
  static const PostRating safe = PostRating._('s');

  /// The questionable rating.
  static const PostRating questionable = PostRating._('q');

  /// The explicit rating.
  static const PostRating explicit = PostRating._('e');

  @override
  String toString() => _value;
}
