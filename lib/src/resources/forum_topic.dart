part of '../core/resource.dart';

final class ForumTopic extends Resource {
  final String creatorId;

  final String updaterId;

  final String title;

  final int responseCount;

  final bool isSticky;

  final bool isLocked;

  final bool isHidden;

  final String categoryId;

  const ForumTopic._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.creatorId,
    required this.updaterId,
    required this.title,
    required this.responseCount,
    required this.isSticky,
    required this.isLocked,
    required this.isHidden,
    required this.categoryId,
  }) : super._();

  ForumTopic._fromJson(super.json)
      : creatorId = json['creator_id'],
        updaterId = json['updater_id'],
        title = json['title'],
        responseCount = json['response_count'],
        isSticky = json['is_sticky'],
        isLocked = json['is_locked'],
        isHidden = json['is_hidden'],
        categoryId = json['category_id'],
        super._fromJson();

  factory ForumTopic.fromJson(final Map<String, dynamic> json) =>
      ForumTopic._fromJson(json);
}
