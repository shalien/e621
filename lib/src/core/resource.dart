part of 'data_access_object.dart';

/// A resource in the e621 API.
@immutable
abstract base class Resource {
  /// The ID of the resource.
  final String id;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The date and time the resource was last updated.
  final DateTime updatedAt;

  /// Creates a new [Resource].
  const Resource._({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  Resource._fromJson(final Map<String, dynamic> json)
      : this._(
            id: json['id'],
            createdAt: DateTime.parse(json['created_at']),
            updatedAt: DateTime.parse(json['updated_at']));
}
