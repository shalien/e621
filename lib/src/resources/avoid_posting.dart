part of '../core/resource.dart';

final class AvoidPosting extends Resource {
  /// [User.id] of the creator
  final String creatorId;

  /// [User.id] of the last updater
  final String updaterId;

  /// [Artist.id] of [Artist] implied by this rule
  final String artistId;

  /// Only visible by Janitor+ users
  final String? staffNotes;

  final String details;

  final bool isActive;

  const AvoidPosting._(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required this.creatorId,
      required this.updaterId,
      required this.artistId,
      this.staffNotes = '',
      required this.details,
      required this.isActive})
      : super._();

  AvoidPosting._fromJson(super.json)
      : creatorId = json['creator_id'],
        updaterId = json['updater_id'],
        artistId = json['artist_id'],
        staffNotes = json['staff_notes'],
        details = json['details'],
        isActive = json['is_active'] == '1',
        super._fromJson();

  factory AvoidPosting.fromJson(final Map<String, dynamic> json) =>
      AvoidPosting._fromJson(json);
}
