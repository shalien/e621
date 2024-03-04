import 'package:meta/meta.dart';

@internal
@immutable

/// A Score subpart of a post.
final class Score {
  /// The number of upvotes.
  final int up;

  /// The number of downvotes.
  final int down;

  /// The total score.
  final int total;

  /// Creates a new score.
  const Score({required this.up, required this.down, required this.total});

  /// Creates a score from a map.
  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(up: json['up'], down: json['down'], total: json['total']);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Score) return false;
    return other.up == up && other.down == down && other.total == total;
  }

  @override
  int get hashCode => up.hashCode ^ down.hashCode ^ total.hashCode;
}
