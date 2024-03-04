import 'package:meta/meta.dart';

@internal
@immutable

/// A Preview subpart of a post.
final class Preview {
  /// The width of the preview in pixels.
  final int width;

  /// The height of the preview in pixels.
  final int height;

  /// The URL of the preview.
  final Uri? url;

  /// Creates a new preview.
  const Preview({required this.width, required this.height, required this.url});

  /// Creates a preview from a map.
  factory Preview.fromJson(Map<String, dynamic> json) {
    return Preview(
        width: json['width'],
        height: json['height'],
        url: json['url'] == null ? null : Uri.tryParse(json['url']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Preview) return false;
    return other.width == width && other.height == height && other.url == url;
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode ^ url.hashCode;
}
