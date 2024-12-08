part of '../core/resource.dart';

final class FullCurrentUser extends Resource {
  final bool blacklistUsers;

  final bool descriptionCollapsedInitially;

  final bool hideComments;

  final bool showHiddenComments;

  final bool showPostStatistics;

  final bool receiveEmailNotifications;

  final bool enableKeyboardNavigation;

  final bool enablePrivacyMode;

  final bool styleUsername;

  final bool enableAutoComplete;

  final bool disabledCroppedThumbnails;

  final bool enableSafeMode;

  final bool disableResponsiveMode;

  final bool noFlagging;

  final bool disableUserDMails;

  final bool enableCompactUploader;

  final bool replacementsBeta;

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

  final int apiRegenMultiplier;

  final int apiBurstMultiplier;

  final int apiBurstLimit;

  final int statementTimeout;

  final int favoriteLimit;

  final int tagQueryLimit;

  final bool hasMail;

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

  const FullCurrentUser({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.blacklistUsers,
    required this.descriptionCollapsedInitially,
    required this.hideComments,
    required this.showHiddenComments,
    required this.showPostStatistics,
    required this.receiveEmailNotifications,
    required this.enableKeyboardNavigation,
    required this.enablePrivacyMode,
    required this.styleUsername,
    required this.enableAutoComplete,
    required this.disabledCroppedThumbnails,
    required this.enableSafeMode,
    required this.disableResponsiveMode,
    required this.noFlagging,
    required this.disableUserDMails,
    required this.enableCompactUploader,
    required this.replacementsBeta,
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
    required this.apiRegenMultiplier,
    required this.apiBurstMultiplier,
    required this.apiBurstLimit,
    required this.statementTimeout,
    required this.favoriteLimit,
    required this.tagQueryLimit,
    required this.hasMail,
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

  FullCurrentUser._fromJson(super.json)
      : blacklistUsers = json['blacklist_users'],
        descriptionCollapsedInitially = json['description_collapsed_initially'],
        hideComments = json['hide_comments'],
        showHiddenComments = json['show_hidden_comments'],
        showPostStatistics = json['show_post_statistics'],
        receiveEmailNotifications = json['receive_email_notifications'],
        enableKeyboardNavigation = json['enable_keyboard_navigation'],
        enablePrivacyMode = json['enable_privacy_mode'],
        styleUsername = json['style_username'],
        enableAutoComplete = json['enable_auto_complete'],
        disabledCroppedThumbnails = json['disabled_cropped_thumbnails'],
        enableSafeMode = json['enable_safe_mode'],
        disableResponsiveMode = json['disable_responsive_mode'],
        noFlagging = json['no_flagging'],
        disableUserDMails = json['disable_user_dmails'],
        enableCompactUploader = json['enable_compact_uploader'],
        replacementsBeta = json['replacements_beta'],
        email = json['email'],
        lastLoggedInAt = json['last_logged_in_at'],
        lastForumReadAt = json['last_forum_read_at'],
        recentTags = json['recent_tags'],
        commentThreshold = json['comment_threshold'],
        defaultImageSize = json['default_image_size'],
        favoriteTags = json['favorite_tags'],
        blacklistedTags = json['blacklisted_tags'],
        timezone = json['timezone'],
        perPage = json['per_page'],
        customStyle = json['custom_style'],
        apiRegenMultiplier = json['api_regen_multiplier'],
        apiBurstMultiplier = json['api_burst_multiplier'],
        apiBurstLimit = json['api_burst_limit'],
        statementTimeout = json['statement_timeout'],
        favoriteLimit = json['favorite_limit'],
        tagQueryLimit = json['tag_query_limit'],
        hasMail = json['has_mail'],
        name = json['name'],
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
