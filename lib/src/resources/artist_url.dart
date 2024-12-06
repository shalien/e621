part of '../core/resource.dart';

/// An artist in the e621 API.
@immutable
final class ArtistUrl extends Resource {
  /// The [Artist.id] linked to this url
  final String artistId;

  final Uri url;

  final Uri normalizedUrl;

  final bool isActive;

  const ArtistUrl._(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required this.artistId,
      required this.url,
      required this.normalizedUrl,
      required this.isActive})
      : super._();

  ArtistUrl._fromJson(super.json)
      : artistId = json['artist_id'],
        url = Uri.parse(json['url']),
        normalizedUrl = Uri.parse(json['normalized_url']),
        isActive = json['is_active'] == '1',
        super._fromJson();

  factory ArtistUrl.fromJson(final Map<String, dynamic> json) =>
      ArtistUrl._fromJson(json);
}
