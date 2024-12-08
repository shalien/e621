part of '../core/resource.dart';

final class ForumPost extends Resource {
  final String topic;
  final String creatorId;
  final String updaterId;
  final String body;
  final bool isHidden;
  final WarningType? warningType;
  final String? warningUserId;

  const ForumPost._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.topic,
    required this.creatorId,
    required this.updaterId,
    required this.body,
    required this.isHidden,
    required this.warningType,
    required this.warningUserId,
  }) : super._();

  ForumPost._fromJson(super.json)
      : topic = json['topic'],
        creatorId = json['creator_id'],
        updaterId = json['updater_id'],
        body = json['body'],
        isHidden = json['is_hidden'],
        warningType = WarningType.fromString(json['warning_type']),
        warningUserId = json['warning_user_id'],
        super._fromJson();

  factory ForumPost.fromJson(final Map<String, dynamic> json) =>
      ForumPost._fromJson(json);
}
