part of '../core/resource.dart';

/// An artist in the e621 API.
@immutable
final class Artist extends Resource {
  /// The name of the artist.
  final String name;

  /// Whether the artist is active.
  final bool isActive;

  /// Other names of the artist.
  final List<String> otherNames;

  /// The user ID of the user representing the artist.
  final String? linkedUserId;

  /// The user ID of the user who created the artist.
  final String creatorId;

  /// Whether the artist is locked.
  final bool isLocked;

  /// The note of the artist.
  final String? note;

  const Artist._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.name,
    required this.isActive,
    required this.otherNames,
    required this.linkedUserId,
    required this.creatorId,
    required this.isLocked,
    required this.note,
  }) : super._();

  Artist._fromJson(super.json)
      : name = json['name'],
        isActive = json['is_active'],
        otherNames = json['other_names'],
        linkedUserId = json['linked_user_id'],
        creatorId = json['creator_id'],
        isLocked = json['is_locked'],
        note = json['note'],
        super._fromJson();

  /// Creates a new [Artist] from a JSON object.
  factory Artist.fromJson(final Map<String, dynamic> json) =>
      Artist._fromJson(json);
}
