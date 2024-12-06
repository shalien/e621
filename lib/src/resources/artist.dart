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

  /// Creates a new [Artist] from a JSON object.
  factory Artist._fromJson(Map<String, dynamic> json) {
    return Artist._(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String,
      isActive: json['is_active'] as bool,
      otherNames: (json['other_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      linkedUserId: json['linked_user_id'] as String?,
      creatorId: json['creator_id'] as String,
      isLocked: json['is_locked'] as bool,
      note: json['note'] as String?,
    );
  }
}
