part of '../core/resource.dart';

final class Comment extends Resource {
  final String postId;

  final String creatorId;

  final String body;

  final int score;

  final String updaterId;

  @Deprecated('Will be removed in the future')
  final bool? doNotBumpPost;

  final bool isHidden;

  final bool isSticky; // Guess this is why you have to wash your hands after

  final WarningType warningType;

  final String warningUserId;

  final String creatorName;

  final String updaterName;

  const Comment._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.postId,
    required this.creatorId,
    required this.body,
    required this.score,
    required this.updaterId,
    required this.doNotBumpPost,
    required this.isHidden,
    required this.isSticky,
    required this.warningType,
    required this.warningUserId,
    required this.creatorName,
    required this.updaterName,
  }) : super._();

  Comment._fromJson(super.json)
      : postId = json['post_id'],
        creatorId = json['creator_id'],
        body = json['body'],
        score = json['score'],
        updaterId = json['updater_id'],
        doNotBumpPost = json['do_not_bump_post'] ?? json['do_not_bump_post_id'],
        isHidden = json['is_hidden'],
        isSticky = json['is_sticky'],
        warningType = WarningType.fromString(json['warning_type']),
        warningUserId = json['warning_user_id'],
        creatorName = json['creator_name'],
        updaterName = json['updater_name'],
        super._fromJson();

  factory Comment.fromJson(final Map<String, dynamic> json) =>
      Comment._fromJson(json);
}
