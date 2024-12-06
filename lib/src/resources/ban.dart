part of '../core/resource.dart';

final class Ban extends Resource {
  final String userId;

  final String reason;

  final DateTime? expiresAt;

  final String? bannerId;

  const Ban._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.userId,
    required this.reason,
    required this.expiresAt,
    required this.bannerId,
  }) : super._();

  Ban._fromJson(super.json)
      : userId = json['user_id'],
        reason = json['reason'],
        expiresAt = json['expires_at'] != null
            ? DateTime.parse(json['expires_at'])
            : null,
        bannerId = json['banner_id'],
        super._fromJson();
}
