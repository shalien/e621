import 'package:meta/meta.dart';

@immutable
@internal

/// The [Post.tags] of a [Post].
final class Tags {
  /// The general tags of the post.
  final List<String> general;

  /// The species tags of the post.
  final List<String> species;

  /// The character tags of the post.
  final List<String> character;

  /// The artist tags of the post.
  final List<String> artist;

  /// The invalid tags of the post.
  final List<String> invalid;

  /// The lore tags of the post.
  final List<String> lore;

  /// The meta tags of the post.
  final List<String> meta;

  const Tags(
      {required this.general,
      required this.species,
      required this.character,
      required this.artist,
      required this.invalid,
      required this.lore,
      required this.meta});

  factory Tags.fromJson(Map<String, dynamic> json) {
    return Tags(
        general: List<String>.from(json['general']),
        species: List<String>.from(json['species']),
        character: List<String>.from(json['character']),
        artist: List<String>.from(json['artist']),
        invalid: List<String>.from(json['invalid']),
        lore: List<String>.from(json['lore']),
        meta: List<String>.from(json['meta']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Tags) return false;
    return other.general == general &&
        other.species == species &&
        other.character == character &&
        other.artist == artist &&
        other.invalid == invalid &&
        other.lore == lore &&
        other.meta == meta;
  }

  @override
  int get hashCode =>
      general.hashCode ^
      species.hashCode ^
      character.hashCode ^
      artist.hashCode ^
      invalid.hashCode ^
      lore.hashCode ^
      meta.hashCode;
}
