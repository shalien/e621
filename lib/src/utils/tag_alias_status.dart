
/// Represents the status of a tag alias.
enum TagAliasStatus {
  approved._('approved'),
  active._('active'),
  pending._('pending'),
  deleted._('deleted'),
  retired._('retired'),
  processing._('processing'),
  queued._('queued');

  /// The value of the enum.
  final String _value;

  /// Creates a new [TagAliasStatus].
  const TagAliasStatus._(this._value);

  @override
  String toString() => _value;
}
