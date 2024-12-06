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

  ArtistVersion._fromJson(super.json)
      : artistId = json['artist_id'],
        name = json['name'],
        updaterId = json['updater_id'],
        isActive = json['is_active'],
        otherNames = json['other_names'],
        notesChanged = json['notes_changed'],
        urls = json['urls'].map((e) => Uri.parse(e)),
        super._fromJson();

  factory ArtistVersion.fromJson(final Map<String, dynamic> json) =>
      ArtistVersion._fromJson(json);
}
