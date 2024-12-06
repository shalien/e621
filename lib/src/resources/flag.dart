part of '../core/resource.dart';

@immutable

/// A [Flag] on a [Post].
final class Flag extends Resource {
  /// The time the flag was created in the format of YYYY-MM-DDTHH:MM:SS.MS+00:00.
  final String createdAt;

  /// The [Post.id] of the [Post] that the flag applies to.
  final int postId;

  /// The user ID of the user who created the flag.
  final int? creatorId;

  /// The reason submitted for the flag.
  final String reason;

  ///  If the flag has been handled
  final bool isResolved;

  /// The time the flag was last updated in the format of YYYY-MM-DDTHH:MM:SS.MS+00:00.
  final String updatedAt;

  /// If the flag is a flag for deletion.
  final bool isDeletion;

  /// The category of the flag.
  final String? category;

  /// THIS TYPE WASN'T IN THE API DOCUMENTATION
  /// Added after api testing
  String? get type => category;

  /// Creates a new [Flag].
  const Flag(
      {required int id,
      required this.createdAt,
      required this.postId,
      required this.reason,
      required this.isResolved,
      required this.updatedAt,
      required this.isDeletion,
      required this.category,
      this.creatorId})
      : super(id: id);

  Flag.fromMap(Map<String, dynamic> map)
      : createdAt = map['created_at'],
        postId = map['post_id'],
        reason = map['reason'],
        isResolved = map['is_resolved'],
        updatedAt = map['updated_at'],
        isDeletion = map['is_deletion'],
        category = map['type'],
        creatorId = map['creator_id'],
        super._fromMap(map);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Flag) return false;
    return other.createdAt == createdAt &&
        other.postId == postId &&
        other.reason == reason &&
        other.isResolved == isResolved &&
        other.updatedAt == updatedAt &&
        other.isDeletion == isDeletion &&
        other.category == category &&
        other.creatorId == creatorId;
  }

  @override
  Flag copyWith(
      {String? createdAt,
      int? postId,
      String? reason,
      bool? isResolved,
      String? updatedAt,
      bool? isDeletion,
      String? category,
      int? creatorId}) {
    return Flag(
        id: id,
        createdAt: createdAt ?? this.createdAt,
        postId: postId ?? this.postId,
        reason: reason ?? this.reason,
        isResolved: isResolved ?? this.isResolved,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeletion: isDeletion ?? this.isDeletion,
        category: category ?? this.category,
        creatorId: creatorId ?? this.creatorId);
  }

  @override
  int get hashCode =>
      createdAt.hashCode ^
      postId.hashCode ^
      reason.hashCode ^
      isResolved.hashCode ^
      updatedAt.hashCode ^
      isDeletion.hashCode ^
      category.hashCode ^
      creatorId.hashCode;

  @override
  String toString() {
    return 'Flag{createdAt: $createdAt, postId: $postId, reason: $reason, isResolved: $isResolved, updatedAt: $updatedAt, isDeletion: $isDeletion, category: $category, creatorId: $creatorId, id: $id}';
  }
}
