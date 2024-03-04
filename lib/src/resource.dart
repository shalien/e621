import 'package:e621/src/utils/tag_category.dart';
import 'package:meta/meta.dart';

import 'resources/post/file.dart';
import 'resources/post/flags.dart';
import 'resources/post/preview.dart';
import 'resources/post/relationship.dart';
import 'resources/post/sample.dart';
import 'resources/post/score.dart';
import 'resources/post/tags.dart';

part 'resources/flag.dart';
part 'resources/post.dart';
part 'resources/tag.dart';
part 'resources/tag_alias.dart';
part 'resources/tag_implication.dart';
part 'resources/vote.dart';

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
  String toString();

  @override
  @mustBeOverridden
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Resource && runtimeType == other.runtimeType && id == other.id;

  @override
  @mustBeOverridden
  int get hashCode => id.hashCode;
}
