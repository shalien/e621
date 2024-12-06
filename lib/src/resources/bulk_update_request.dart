part of '../core/resource.dart';

@immutable
final class BulkUpdateRequest extends Resource {
  final String creatorId;

  final String? forumTopicId;

  final String script;

  final Status status;

  final String? approverId;

  final String? forumPostId;

  final String title;

  const BulkUpdateRequest._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.creatorId,
    required this.forumTopicId,
    required this.script,
    required this.status,
    required this.approverId,
    required this.forumPostId,
    required this.title,
  }) : super._();

  BulkUpdateRequest._fromJson(super.json)
      : creatorId = json['creator_id'],
        forumTopicId = json['forum_topic_id'],
        script = json['script'],
        status = Status.fromString(json['status']),
        approverId = json['approver_id'],
        forumPostId = json['forum_post_id'],
        title = json['title'],
        super._fromJson();

  factory BulkUpdateRequest.fromJson(final Map<String, dynamic> json) =>
      BulkUpdateRequest._fromJson(json);
}
