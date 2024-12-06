part of '../core/resource.dart';

final class CurrentUser extends Resource {
  final String name;

  final int level;

  final int baseUploadLimit;

  final int postUploadCount;

  final int postUpdateCount;

  final int noteUpdateCount;

  final bool isBanned;

  final bool canUploadFree;

  final String levelString;

  final String? avatarId;

  final bool blacklistUsers;

  final bool descriptionCollapsedInitially;

  final bool hideComments;

  final bool showHiddenComments;

  final bool showPostStatistics;

  final bool receiveEmailNotifications;

  final bool enableKeywordNavigation;

  final bool enablePrivacyMode;

  final bool styleUsernames;

  final bool enableAutoComplete;

  final bool canApprovePosts;

  final bool disabledCroppedThumbnails;

  final bool enableSafeMode;

  final bool disableResponsiveMode;

  final bool noFlagging;

  final bool disableUserDmails;

  final bool enableCompactUploader;

  final bool replacementBeta;

  final String email;

  final DateTime lastLoggedInAt;

  final DateTime lastForumReadAt;

  final String recentTags;

  final int commentThreshold;

  final DefaultImageSize defaultImageSize;

  final String favoriteTags;

  final String blacklistedTags;

  final String timezone;

  final int perPage;

  final String customStyle;

  final int favoriteCount;

  final int apiRegenMultiplier;

  final int apiBurstLimit;

  final int remainingApiLimit;

  final int statementTimeout;

  final int favoriteLimit;

  final int tagQueryLimit;

  final bool hasMail;

  const CurrentUser({
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
    required this.canUploadFree,
    required this.levelString,
    this.avatarId,
    required this.blacklistUsers,
    required this.descriptionCollapsedInitially,
    required this.hideComments,
    required this.showHiddenComments,
    required this.showPostStatistics,
    required this.receiveEmailNotifications,
    required this.enableKeywordNavigation,
    required this.enablePrivacyMode,
    required this.styleUsernames,
    required this.enableAutoComplete,
    required this.canApprovePosts,
    required this.disabledCroppedThumbnails,
    required this.enableSafeMode,
    required this.disableResponsiveMode,
    required this.noFlagging,
    required this.disableUserDmails,
    required this.enableCompactUploader,
    required this.replacementBeta,
    required this.email,
    required this.lastLoggedInAt,
    required this.lastForumReadAt,
    required this.recentTags,
    required this.commentThreshold,
    required this.defaultImageSize,
    required this.favoriteTags,
    required this.blacklistedTags,
    required this.timezone,
    required this.perPage,
    required this.customStyle,
    required this.favoriteCount,
    required this.apiRegenMultiplier,
    required this.apiBurstLimit,
    required this.remainingApiLimit,
    required this.statementTimeout,
    required this.favoriteLimit,
    required this.tagQueryLimit,
    required this.hasMail,
  }) : super._();

  CurrentUser._fromJson(super.json)
      : name = json['name'],
        level = json['level'],
        baseUploadLimit = json['base_upload_limit'],
        postUploadCount = json['post_upload_count'],
        postUpdateCount = json['post_update_count'],
        noteUpdateCount = json['note_update_count'],
        isBanned = json['is_banned'],
        canUploadFree = json['can_upload_free'],
        levelString = json['level_string'],
        avatarId = json['avatar_id'],
        blacklistUsers = json['blacklist_users'],
        descriptionCollapsedInitially = json['description_collapsed_initially'],
        hideComments = json['hide_comments'],
        showHiddenComments = json['show_hidden_comments'],
        showPostStatistics = json['show_post_statistics'],
        receiveEmailNotifications = json['receive_email_notifications'],
        enableKeywordNavigation = json['enable_keyword_navigation'],
        enablePrivacyMode = json['enable_privacy_mode'],
        styleUsernames = json['style_usernames'],
        enableAutoComplete = json['enable_auto_complete'],
        canApprovePosts = json['can_approve_posts'],
        disabledCroppedThumbnails = json['disabled_cropped_thumbnails'],
        enableSafeMode = json['enable_safe_mode'],
        disableResponsiveMode = json['disable_responsive_mode'],
        noFlagging = json['no_flagging'],
        disableUserDmails = json['disable_user_dmails'],
        enableCompactUploader = json['enable_compact_uploader'],
        replacementBeta = json['replacement_beta'],
        email = json['email'],
        lastLoggedInAt = DateTime.parse(json['last_logged_in_at']),
        lastForumReadAt = DateTime.parse(json['last_forum_read_at']),
        recentTags = json['recent_tags'],
        commentThreshold = json['comment_threshold'],
        defaultImageSize =
            DefaultImageSize.fromString(json['default_image_size']),
        favoriteTags = json['favorite_tags'],
        blacklistedTags = json['blacklisted_tags'],
        timezone = json['timezone'],
        perPage = json['per_page'],
        customStyle = json['custom_style'],
        favoriteCount = json['favorite_count'],
        apiRegenMultiplier = json['api_regen_multiplier'],
        apiBurstLimit = json['api_burst_limit'],
        remainingApiLimit = json['remaining_api_limit'],
        statementTimeout = json['statement_timeout'],
        favoriteLimit = json['favorite_limit'],
        tagQueryLimit = json['tag_query_limit'],
        hasMail = json['has_mail'],
        super._fromJson();

  factory CurrentUser.fromJson(final Map<String, dynamic> json) =>
      CurrentUser._fromJson(json);
}
