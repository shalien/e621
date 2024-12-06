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

  fianl bool showPostStatistics;

  final bool showDeletedPosts;
}
