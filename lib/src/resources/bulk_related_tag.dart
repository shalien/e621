part of '../core/resource.dart';

final class BulkRelatedTag {
  final String name;

  final String categoryId;

  final int count;

  const BulkRelatedTag._({
    required this.name,
    required this.categoryId,
    required this.count,
  });

  BulkRelatedTag._fromJson(final Map<String, dynamic> json)
      : name = json['name'],
        categoryId = json['category_id'],
        count = json['count'];

  factory BulkRelatedTag.fromJson(final Map<String, dynamic> json) =>
      BulkRelatedTag._fromJson(json);
}
