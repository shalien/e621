import 'package:meta/meta.dart';

@internal
@immutable

/// A [Post.sample] subpart of a [Post].
final class Sample {
  /// does the sample exist
  final bool has;

  /// The width of the sample in pixels.
  final int width;

  /// The height of the sample in pixels.
  final int height;

  /// The URL of the sample.
  final Uri? url;

  /// Creates a new sample.
  const Sample(
      {required this.has,
      required this.width,
      required this.height,
      required this.url});

  /// Creates a sample from a map.
  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
        has: json['has'],
        width: json['width'],
        height: json['height'],
        url: json['url'] == null ? null : Uri.tryParse(json['url']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Sample) return false;
    return other.has == has &&
        other.width == width &&
        other.height == height &&
        other.url == url;
  }

  @override
  int get hashCode =>
      has.hashCode ^ width.hashCode ^ height.hashCode ^ url.hashCode;
}
