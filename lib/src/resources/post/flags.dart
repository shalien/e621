import 'package:meta/meta.dart';

@internal
@immutable

/// The [Post.flags] of a [Post].
final class Flags {
  /// is the post pending
  final bool pending;

  /// is the post flagged
  final bool flagged;

  /// is the note locked
  final bool noteLocked;

  /// is the status locked
  final bool statusLocked;

  /// is the rating locked
  final bool ratingLocked;

  /// is the post deleted
  final bool deleted;

  /// Creates a new flags.
  const Flags({
    required this.pending,
    required this.flagged,
    required this.noteLocked,
    required this.statusLocked,
    required this.ratingLocked,
    required this.deleted,
  });

  /// Creates a flags from a map.
  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      pending: json['pending'],
      flagged: json['flagged'],
      noteLocked: json['note_locked'],
      statusLocked: json['status_locked'],
      ratingLocked: json['rating_locked'],
      deleted: json['deleted'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Flags) return false;
    return other.pending == pending &&
        other.flagged == flagged &&
        other.noteLocked == noteLocked &&
        other.statusLocked == statusLocked &&
        other.ratingLocked == ratingLocked &&
        other.deleted == deleted;
  }

  @override
  int get hashCode =>
      pending.hashCode ^
      flagged.hashCode ^
      noteLocked.hashCode ^
      statusLocked.hashCode ^
      ratingLocked.hashCode ^
      deleted.hashCode;
}
