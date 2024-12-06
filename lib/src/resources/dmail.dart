part of '../core/resource.dart';

final class Dmail extends Resource {
  final String ownerId;

  final String fromId;

  final String toId;

  final String title;

  final String body;

  final bool isRead;

  final bool isDeleted;

  const Dmail({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.ownerId,
    required this.fromId,
    required this.toId,
    required this.title,
    required this.body,
    required this.isRead,
    required this.isDeleted,
  }) : super._();

  Dmail._fromJson(super.json)
      : ownerId = json['owner_id'],
        fromId = json['from_id'],
        toId = json['to_id'],
        title = json['title'],
        body = json['body'],
        isRead = json['is_read'],
        isDeleted = json['is_deleted'],
        super._fromJson();

  factory Dmail.fromJson(final Map<String, dynamic> json) =>
      Dmail._fromJson(json);
}
