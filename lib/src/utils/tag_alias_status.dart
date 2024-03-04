import 'package:meta/meta.dart';

@immutable

/// Represents the status of a tag alias.
final class TagAliasStatus {
  /// The value of the enum.
  final String _value;

  /// Creates a new [TagAliasStatus].
  const TagAliasStatus._(this._value);

  static const TagAliasStatus approved = TagAliasStatus._('approved');
  static const TagAliasStatus active = TagAliasStatus._('active');
  static const TagAliasStatus pending = TagAliasStatus._('pending');
  static const TagAliasStatus deleted = TagAliasStatus._('deleted');
  static const TagAliasStatus retired = TagAliasStatus._('retired');
  static const TagAliasStatus processing = TagAliasStatus._('processing');
  static const TagAliasStatus queued = TagAliasStatus._('queued');
}
