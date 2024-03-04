import 'package:meta/meta.dart';

@internal
@immutable

/// A File subpart of a post.
final class File {
  /// The width of the file in pixels.
  final int width;

  /// The height of the file in pixels.
  final int height;

  /// The file extension.
  final String ext;

  /// The file size in bytes.
  final int size;

  /// The MD5 hash of the file.
  final String md5;

  /// The URL of the file.
  final Uri? url;

  /// Creates a new file.
  const File(
      {required this.width,
      required this.height,
      required this.ext,
      required this.size,
      required this.md5,
      required this.url});

  /// Creates a file from a map.
  factory File.fromJson(Map<String, dynamic> json) {
    return File(
        width: json['width'],
        height: json['height'],
        ext: json['ext'],
        size: json['size'],
        md5: json['md5'],
        url: json['url'] == null ? null : Uri.tryParse(json['url']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! File) return false;
    return other.width == width &&
        other.height == height &&
        other.ext == ext &&
        other.size == size &&
        other.md5 == md5 &&
        other.url == url;
  }

  @override
  int get hashCode =>
      width.hashCode ^
      height.hashCode ^
      ext.hashCode ^
      size.hashCode ^
      md5.hashCode ^
      url.hashCode;
}
