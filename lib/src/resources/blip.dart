part of '../core/resource.dart';

@immutable
final class Blip extends Resource {
  final String creatorId;

  final String body;

  final String responseId;

  final bool isHidden;

  final WarningType warningType;

  final String warningUserId;

  final String updaterId;

  final String creatorName;

  const Blip._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.creatorId,
    required this.body,
    required this.responseId,
    required this.isHidden,
    required this.warningType,
    required this.warningUserId,
    required this.updaterId,
    required this.creatorName,
  }) : super._();

  Blip._fromJson(super.json)
      : creatorId = json['creator_id'],
        body = json['body'],
        responseId = json['response_id'],
        isHidden = json['is_hidden'],
        warningType = WarningType.fromString(json['warning_type']),
        warningUserId = json['warning_user_id'],
        updaterId = json['updater_id'],
        creatorName = json['creator_name'],
        super._fromJson();

  factory Blip.fromJson(final Map<String, String> json) => Blip._fromJson(json);
}
