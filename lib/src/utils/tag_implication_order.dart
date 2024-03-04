/// An enum for the order of tag Implications.
enum TagImplicationOrder {
  status._(value: 'status'),
  createdAt._(value: 'created_at'),
  updatedAt._(value: 'updated_at'),
  name._(value: 'name'),
  postCount._(value: 'post_count');

  /// The value of the enum.
  final String value;

  /// Creates a new [TagImplicationOrder].
  const TagImplicationOrder._({required this.value});

  @override
  String toString() => value;
}
