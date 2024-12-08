part of '../core/resource.dart';

final class FullUser extends Resource {
  final String name;

  final int level;

  final int baseUploadLimit;

  final int postUploadCount;

  final int postUpdateCount;

  final int noteUpdateCount;

  final bool isBanned;

  final bool canApprovePosts;

  final bool canUploadFree;

  final String levelString;

  final String? avatarId;

  final int wikiPageVersionCount;

  final int artistVersionCount;

  final int poolVersionCount;

  final int forumPostCount;

  final int commentCount;

  final int flagCount;

  final int favoriteCount;

  final int positiveFeedbackCount;

  final int neutralFeedbackCount;

  final int negativeFeedbackCount;

  final int uploadLimit;

  final String profileAbout;

  final String profileArtinfo;

  const FullUser._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.name,
    required this.level,
    required this.baseUploadLimit,
    required this.postUploadCount,
    required this.postUpdateCount,
    required this.noteUpdateCount,
    required this.isBanned,
    required this.canApprovePosts,
    required this.canUploadFree,
    required this.levelString,
    required this.avatarId,
    required this.wikiPageVersionCount,
    required this.artistVersionCount,
    required this.poolVersionCount,
    required this.forumPostCount,
    required this.commentCount,
    required this.flagCount,
    required this.favoriteCount,
    required this.positiveFeedbackCount,
    required this.neutralFeedbackCount,
    required this.negativeFeedbackCount,
    required this.uploadLimit,
    required this.profileAbout,
    required this.profileArtinfo,
  }) : super._();

  FullUser._fromJson(super.json)
      : name = json['name'],
        level = json['level'],
        baseUploadLimit = json['base_upload_limit'],
        postUploadCount = json['post_upload_count'],
        postUpdateCount = json['post_update_count'],
        noteUpdateCount = json['note_update_count'],
        isBanned = json['is_banned'],
        canApprovePosts = json['can_approve_posts'],
        canUploadFree = json['can_upload_free'],
        levelString = json['level_string'],
        avatarId = json['avatar_id'],
        wikiPageVersionCount = json['wiki_page_version_count'],
        artistVersionCount = json['artist_version_count'],
        poolVersionCount = json['pool_version_count'],
        forumPostCount = json['forum_post_count'],
        commentCount = json['comment_count'],
        flagCount = json['flag_count'],
        favoriteCount = json['favorite_count'],
        positiveFeedbackCount = json['positive_feedback_count'],
        neutralFeedbackCount = json['neutral_feedback_count'],
        negativeFeedbackCount = json['negative_feedback_count'],
        uploadLimit = json['upload_limit'],
        profileAbout = json['profile_about'],
        profileArtinfo = json['profile_artinfo'],
        super._fromJson();
}
