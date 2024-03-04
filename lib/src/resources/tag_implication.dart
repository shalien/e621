part of '../resource.dart';

@immutable

/// A tag implication in the e621 API.
final class TagImplication extends Resource {
  /// The status of the tag alias
  final String status;

  /// The antecedent name of the tag alias
  final String antecedentName;

  /// The consequent name of the tag alias
  final String consequentName;

  /// The count of posts
  final int postCount;

  /// The reason for the tag alias
  final String reason;

  /// The creator ID of the tag alias
  final int creatorId;

  /// The approver ID of the tag alias
  final int approverId;

  /// The creation time of the tag alias
  final String createdAt;

  /// The last update time of the tag alias
  final String updatedAt;

  /// The forum post ID of the tag alias
  final int forumPostId;

  /// The forum topic of the tag alias
  final int forumTopic;

  /// Creates a new [TagImplication].
  const TagImplication(
      {required super.id,
      required this.status,
      required this.antecedentName,
      required this.consequentName,
      required this.postCount,
      required this.reason,
      required this.creatorId,
      required this.approverId,
      required this.createdAt,
      required this.updatedAt,
      required this.forumPostId,
      required this.forumTopic});

  /// Creates a [TagImplication] from a map.
  TagImplication.fromMap(Map<String, dynamic> map)
      : status = map['status'],
        antecedentName = map['antecedent_name'],
        consequentName = map['consequent_name'],
        postCount = map['post_count'],
        reason = map['reason'],
        creatorId = map['creator_id'],
        approverId = map['approver_id'],
        createdAt = map['created_at'],
        updatedAt = map['updated_at'],
        forumPostId = map['forum_post_id'],
        forumTopic = map['forum_topic'],
        super._fromMap(map);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TagImplication) return false;
    return status == other.status &&
        antecedentName == other.antecedentName &&
        consequentName == other.consequentName &&
        postCount == other.postCount &&
        reason == other.reason &&
        creatorId == other.creatorId &&
        approverId == other.approverId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        forumPostId == other.forumPostId &&
        forumTopic == other.forumTopic;
  }

  @override
  copyWith({
    String? status,
    String? antecedentName,
    String? consequentName,
    int? postCount,
    String? reason,
    int? creatorId,
    int? approverId,
    String? createdAt,
    String? updatedAt,
    int? forumPostId,
    int? forumTopic,
  }) {
    return TagImplication(
      id: id,
      status: status ?? this.status,
      antecedentName: antecedentName ?? this.antecedentName,
      consequentName: consequentName ?? this.consequentName,
      postCount: postCount ?? this.postCount,
      reason: reason ?? this.reason,
      creatorId: creatorId ?? this.creatorId,
      approverId: approverId ?? this.approverId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      forumPostId: forumPostId ?? this.forumPostId,
      forumTopic: forumTopic ?? this.forumTopic,
    );
  }

  @override
  int get hashCode =>
      super.hashCode ^
      status.hashCode ^
      antecedentName.hashCode ^
      consequentName.hashCode ^
      postCount.hashCode ^
      reason.hashCode ^
      creatorId.hashCode ^
      approverId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      forumPostId.hashCode ^
      forumTopic.hashCode;

  @override
  String toString() {
    return 'TagImplication{status: $status, antecedentName: $antecedentName, consequentName: $consequentName, postCount: $postCount, reason: $reason, creatorId: $creatorId, approverId: $approverId, createdAt: $createdAt, updatedAt: $updatedAt, forumPostId: $forumPostId, forumTopic: $forumTopic, id: $id}';
  }
}
