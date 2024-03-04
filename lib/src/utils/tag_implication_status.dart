import 'package:meta/meta.dart';

@immutable

/// Represents the status of a tag Implication.
final class TagImplicationStatus {
  /// The value of the enum.
  final String _value;

  /// Creates a new [TagImplicationStatus].
  const TagImplicationStatus._(this._value);

  static const TagImplicationStatus approved =
      TagImplicationStatus._('approved');
  static const TagImplicationStatus active = TagImplicationStatus._('active');
  static const TagImplicationStatus pending = TagImplicationStatus._('pending');
  static const TagImplicationStatus deleted = TagImplicationStatus._('deleted');
  static const TagImplicationStatus retired = TagImplicationStatus._('retired');
  static const TagImplicationStatus processing =
      TagImplicationStatus._('processing');
  static const TagImplicationStatus queued = TagImplicationStatus._('queued');
}
