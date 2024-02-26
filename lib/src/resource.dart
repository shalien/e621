import 'package:meta/meta.dart';

part 'resources/post.dart';

/// A resource in the e621 API.
abstract base class Resource {
  /// The ID of this resource.
  final int id;

  /// Creates a resource.
  const Resource({required this.id});

  /// Creates a resource from a map.
  Resource._fromMap(Map<String, dynamic> map) : id = map['id'];

  /// Converts this resource to a map.
  @mustBeOverridden
  copyWith();

  @override
  @mustBeOverridden
  String toString() => 'Resource(id: $id)';

  @override
  @mustBeOverridden
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Resource && runtimeType == other.runtimeType && id == other.id;

  @override
  @mustBeOverridden
  int get hashCode => id.hashCode;
}
