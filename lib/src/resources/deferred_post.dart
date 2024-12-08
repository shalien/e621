part of '../core/resource.dart';

final class DeferredPost extends Resource {
  final String flags;

  final String tags;

  final Rating rating;

  final String fileExt;

  final int width;

  final int height;

  final int size;

  final String uploader;

  final String uploaderId;

  final int score;

  final int favCount;

  final bool isFavorited;

  final List<String> pools;

  final String md5;

  final Uri? previewUrl;

  final Uri? largeUrl;

  final Uri? fileUrl;

  final int previewWidth;

  final int previewHeight;

  const DeferredPost._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.flags,
    required this.tags,
    required this.rating,
    required this.fileExt,
    required this.width,
    required this.height,
    required this.size,
    required this.uploader,
    required this.uploaderId,
    required this.score,
    required this.favCount,
    required this.isFavorited,
    required this.pools,
    required this.md5,
    required this.previewUrl,
    required this.largeUrl,
    required this.fileUrl,
    required this.previewWidth,
    required this.previewHeight,
  }) : super._();

  DeferredPost._fromJson(super.json)
      : flags = json['flags'],
        tags = json['tags'],
        rating = json['rating'],
        fileExt = json['file_ext'],
        width = json['width'],
        height = json['height'],
        size = json['size'],
        uploader = json['uploader'],
        uploaderId = json['uploader_id'],
        score = json['score'],
        favCount = json['fav_count'],
        isFavorited = json['is_favorited'],
        pools = json['pools'],
        md5 = json['md5'],
        previewUrl = json['preview_url'],
        largeUrl = json['large_url'],
        fileUrl = json['file_url'],
        previewWidth = json['preview_width'],
        previewHeight = json['preview_height'],
        super._fromJson();

  factory DeferredPost.fromJson(final Map<String, dynamic> json) =>
      DeferredPost._fromJson(json);
}
