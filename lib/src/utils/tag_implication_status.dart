/// Represents the status of a tag Implication.
enum TagImplicationStatus {
  approved._('approved'),
  active._('active'),
  pending._('pending'),
  deleted._('deleted'),
  retired._('retired'),
  processing._('processing'),
  queued._('queued');

  /// The value of the enum.
  final String _value;

  /// Creates a new [TagImplicationStatus].
  const TagImplicationStatus._(this._value);

  @override
  String toString() => _value;
}
