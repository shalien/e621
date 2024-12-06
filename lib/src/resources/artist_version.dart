part of '../core/resource.dart';

@immutable
final class ArtistVersion extends Resource {
  /// The [Artist.id] of the [Artist] to which this version belongs to.
  final String artistId;

  final String name;

  /// The user ID of the user who updated the artist.
  final String updaterId;

  /// Whether this version of the artist is active.
  final bool isActive;

  final List<String> otherNames;

  final bool notesChanged;

  final List<Uri> urls;

  const ArtistVersion._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.artistId,
    required this.name,
    required this.updaterId,
    required this.isActive,
    required this.otherNames,
    required this.notesChanged,
    required this.urls,
  }) : super._();

  factory ArtistVersion._fromJson(Map<String, dynamic> json) {
    return ArtistVersion._(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      artistId: json['artist_id'] as String,
      name: json['name'] as String,
      updaterId: json['updater_id'] as String,
      isActive: json['is_active'] as bool,
      otherNames: (json['other_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      notesChanged: json['notes_changed'] as bool,
      urls: (json['urls'] as List<dynamic>)
          .map((e) => Uri.parse(e as String))
          .toList(),
    );
  }
}
