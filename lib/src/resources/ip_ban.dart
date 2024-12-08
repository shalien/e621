part of '../core/data_access_object.dart';

@immutable
final class IPBan extends Resource {
  final String creatorId;

  final String reason;

  const IPBan._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.creatorId,
    required this.reason,
  }) : super._();

  IPBan._fromJson(super.json)
      : creatorId = json['creator_id'],
        reason = json['reason'],
        super._fromJson();
}
