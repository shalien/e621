part of '../resource.dart';

@immutable

/// A vote in the e621 API.
/// Since [Vote] aren't really [Resource] [id] is always 0.
/// They're created as resource to make it easier to work with them through [VoteDataAccessObject].
final class Vote extends Resource {
  /// Vote don't have ID so we make a fake one
  @override
  int get id => 0;

  /// [Post] total score
  final int score;

  /// [Post] total upvotes
  final int up;

  /// [Post] total downvotes
  final int down;

  /// Our choices
  final int ourScore;

  /// Creates a new [Vote].
  const Vote(
      {required this.score,
      required this.up,
      required this.down,
      required this.ourScore})
      : super(id: 0);

  Vote.fromMap(Map<String, dynamic> map)
      : score = map['score'],
        up = map['up'],
        down = map['down'],
        ourScore = map['our_score'],
        super(id: 0);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Vote) return false;
    return score == other.score &&
        up == other.up &&
        down == other.down &&
        ourScore == other.ourScore;
  }

  @override
  Vote copyWith({int? score, int? up, int? down, int? ourScore}) {
    return Vote(
      score: score ?? this.score,
      up: up ?? this.up,
      down: down ?? this.down,
      ourScore: ourScore ?? this.ourScore,
    );
  }

  @override
  int get hashCode =>
      score.hashCode ^ up.hashCode ^ down.hashCode ^ ourScore.hashCode;

  @override
  String toString() {
    return 'Vote{score: $score, up: $up, down: $down, ourScore: $ourScore}';
  }
}
