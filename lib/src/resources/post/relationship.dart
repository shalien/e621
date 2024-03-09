import 'package:meta/meta.dart';

@internal
@immutable

/// The [Post.relationship] of a [Post].
final class Relationship {
  /// The ID of the parent post.
  final int? parentId;

  /// does the post have children
  final bool hasChildren;

  /// does the post have active children
  final bool hasActiveChildren;

  /// The IDs of the children posts.
  final List<int> children;

  /// Creates a new relationship.
  const Relationship(
      {required this.parentId,
      required this.hasChildren,
      required this.hasActiveChildren,
      required this.children});

  /// Creates a relationship from a map.
  factory Relationship.fromJson(Map<String, dynamic> json) {
    return Relationship(
        parentId: json['parent_id'],
        hasChildren: json['has_children'],
        hasActiveChildren: json['has_active_children'],
        children: List<int>.from(json['children']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Relationship) return false;
    return other.parentId == parentId &&
        other.hasChildren == hasChildren &&
        other.hasActiveChildren == hasActiveChildren &&
        other.children == children;
  }

  @override
  int get hashCode =>
      parentId.hashCode ^
      hasChildren.hashCode ^
      hasActiveChildren.hashCode ^
      children.hashCode;
}
