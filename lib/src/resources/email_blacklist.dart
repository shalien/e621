part of '../core/resource.dart';

final class EmailBlacklist extends Resource {
  final Uri domain;

  final String creatorId;

  final String reason;

  const EmailBlacklist._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.domain,
    required this.creatorId,
    required this.reason,
  }) : super._();

  EmailBlacklist._fromJson(super.json)
      : domain = Uri.parse(json['domain']),
        creatorId = json['creator_id'],
        reason = json['reason'],
        super._fromJson();

  factory EmailBlacklist.fromJson(final Map<String, dynamic> json) =>
      EmailBlacklist._fromJson(json);
}
