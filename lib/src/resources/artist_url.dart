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

  factory ArtistUrl._fromJson(Map<String, dynamic> json) {
    return ArtistUrl._(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      artistId: json['artist_id'] as String,
      url: Uri.parse(json['url'] as String),
      normalizedUrl: Uri.parse(json['normalized_url'] as String),
      isActive: json['is_active'] as bool,
    );
  }
}
