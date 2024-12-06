import 'package:meta/meta.dart';

import '../resources/post/file.dart';
import '../resources/post/flags.dart';
import '../resources/post/preview.dart';
import '../resources/post/relationship.dart';
import '../resources/post/sample.dart';
import '../resources/post/score.dart';
import '../resources/post/tags.dart';
import '../utils/pool_category.dart';

part '../resources/artist.dart';
part '../resources/artist_url.dart';
part '../resources/artist_version.dart';
part '../resources/flag.dart';
part '../resources/note.dart';
part '../resources/pool.dart';
part '../resources/post.dart';
part '../resources/tag.dart';
part '../resources/tag_alias.dart';
part '../resources/tag_implication.dart';
part '../resources/vote.dart';

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
}
