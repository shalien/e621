part of '../core/resource.dart';

final class ForumPostVote extends Resource {
  final String forumPostId;

  final String creatorId;

  final int score;

  final String creatorName;

  const ForumPostVote._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.forumPostId,
    required this.creatorId,
    required this.score,
    required this.creatorName,
  }) : super._();

  ForumPostVote._fromJson(super.json)
      : forumPostId = json['forum_post_id'],
        creatorId = json['creator_id'],
        score = json['score'],
        creatorName = json['creator_name'],
        super._fromJson();

  factory ForumPostVote.fromJson(final Map<String, dynamic> json) =>
      ForumPostVote._fromJson(json);
}
