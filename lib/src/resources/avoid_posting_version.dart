part of '../core/resource.dart';

final class AvoidPostingVersion extends Resource {
  final String updaterId;

  final String avoidPostingId;

  final String details;

  final String? staffNotes;

  final bool isActive;

  const AvoidPostingVersion._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.updaterId,
    required this.avoidPostingId,
    required this.details,
    required this.staffNotes,
    required this.isActive,
  }) : super._();

  AvoidPostingVersion._fromJson(super.json)
      : updaterId = json['updater_id'],
        avoidPostingId = json['avoid_posting_id'],
        details = json['details'],
        staffNotes = json['staff_notes'],
        isActive = json['is_active'],
        super._fromJson();

  factory AvoidPostingVersion.fromJson(final Map<String, dynamic> json) =>
      AvoidPostingVersion._fromJson(json);
}
