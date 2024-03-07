part of '../resource.dart';

final class Pool extends Resource {
  /// Name of the pool.
  final String name;

  /// The date the pool was created.
  final String createdAt;

  /// The date the pool was last updated.
  final String updatedAt;

  /// The ID of the creator of the pool.
  final String creatorId;

  /// The description of the pool.
  final String description;

  ///  Whether the pool is active.
  final bool isActive;

  /// The category of the pool.
  final PoolCategory category;

  /// The list of post IDs in the pool.
  final List<int> postIds;

  /// The name of the creator of the pool.
  final String creatorName;

  /// The number of posts in the pool.
  final int postCount;

  /// Creates a new [Pool].
  const Pool({
    required super.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.creatorId,
    required this.description,
    required this.isActive,
    required this.category,
    required this.postIds,
    required this.creatorName,
    required this.postCount,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Pool &&
            runtimeType == other.runtimeType &&
            id == other.id &&
            name == other.name &&
            createdAt == other.createdAt &&
            updatedAt == other.updatedAt &&
            creatorId == other.creatorId &&
            description == other.description &&
            isActive == other.isActive &&
            category == other.category &&
            postIds == other.postIds &&
            creatorName == other.creatorName &&
            postCount == other.postCount;
  }

  @override
  Pool copyWith({
    String? name,
    String? createdAt,
    String? updatedAt,
    String? creatorId,
    String? description,
    bool? isActive,
    PoolCategory? category,
    List<int>? postIds,
    String? creatorName,
    int? postCount,
  }) {
    return Pool(
      id: id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      creatorId: creatorId ?? this.creatorId,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      category: category ?? this.category,
      postIds: postIds ?? this.postIds,
      creatorName: creatorName ?? this.creatorName,
      postCount: postCount ?? this.postCount,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      creatorId.hashCode ^
      description.hashCode ^
      isActive.hashCode ^
      category.hashCode ^
      postIds.hashCode ^
      creatorName.hashCode ^
      postCount.hashCode;

  @override
  String toString() {
    return 'Pool{id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, creatorId: $creatorId, description: $description, isActive: $isActive, category: $category, postIds: $postIds, creatorName: $creatorName, postCount: $postCount}';
  }
}
