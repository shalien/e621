import 'package:meta/meta.dart';

import '../enums/default_image_size.dart';
import '../enums/status.dart';
import '../enums/warning_type.dart';
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
part '../resources/avoid_posting.dart';
part '../resources/avoid_posting_version.dart';
part '../resources/ban.dart';
part '../resources/blip.dart';
part '../resources/bulk_related_tag.dart';
part '../resources/bulk_update_request.dart';
part '../resources/comment.dart';
part '../resources/current_user.dart';
part '../resources/dmail.dart';
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

  Resource._fromJson(final Map<String, dynamic> json)
      : this._(
            id: json['id'],
            createdAt: DateTime.parse(json['created_at']),
            updatedAt: DateTime.parse(json['updated_at']));
}
