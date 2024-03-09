part of '../resource.dart';

@immutable
final class Tag extends Resource {
  /// Tag display name
  final String name;

  /// Count of visible posts
  final int postCount;

  /// List of related tags
  final List<String> relatedTags;

  /// Last time related tags were updated
  final String relatedTagsUpdatedAt;

  /// The category of the tag
  /// The following values can be specified.
  /// [TagCategory.general]
  /// [TagCategory.artist]
  /// [TagCategory.copyright]
  /// [TagCategory.character]
  /// [TagCategory.species]
  /// [TagCategory.invalid]
  /// [TagCategory.meta]
  /// [TagCategory.lore]
  final int category;

  /// is the tag locked
  final bool isLocked;

  /// The tag creation time
  final String createdAt;

  /// The tag last update time
  final String updatedAt;

  /// Creates a new [Tag].
  const Tag(
      {required super.id,
      required this.name,
      required this.postCount,
      required this.relatedTags,
      required this.relatedTagsUpdatedAt,
      required this.category,
      required this.isLocked,
      required this.createdAt,
      required this.updatedAt});

  /// Creates a [Tag] from a map.
  Tag.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        postCount = map['post_count'],
        relatedTags = (map['related_tags'] as String).split(' '),
        relatedTagsUpdatedAt = map['related_tags_updated_at'],
        category = map['category'],
        isLocked = map['is_locked'],
        createdAt = map['created_at'],
        updatedAt = map['updated_at'],
        super._fromMap(map);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Tag) return false;
    return name == other.name &&
        postCount == other.postCount &&
        relatedTags == other.relatedTags &&
        relatedTagsUpdatedAt == other.relatedTagsUpdatedAt &&
        category == other.category &&
        isLocked == other.isLocked &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  Tag copyWith(
      {String? name,
      int? postCount,
      List<String>? relatedTags,
      String? relatedTagsUpdatedAt,
      int? category,
      bool? isLocked,
      String? createdAt,
      String? updatedAt}) {
    return Tag(
      id: id,
      name: name ?? this.name,
      postCount: postCount ?? this.postCount,
      relatedTags: relatedTags ?? this.relatedTags,
      relatedTagsUpdatedAt: relatedTagsUpdatedAt ?? this.relatedTagsUpdatedAt,
      category: category ?? this.category,
      isLocked: isLocked ?? this.isLocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  int get hashCode =>
      name.hashCode ^
      postCount.hashCode ^
      relatedTags.hashCode ^
      relatedTagsUpdatedAt.hashCode ^
      category.hashCode ^
      isLocked.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  @override
  String toString() {
    return 'Tag{name: $name, postCount: $postCount, relatedTags: $relatedTags, relatedTagsUpdatedAt: $relatedTagsUpdatedAt, category: $category, isLocked: $isLocked, createdAt: $createdAt, updatedAt: $updatedAt, id: $id}';
  }
}
