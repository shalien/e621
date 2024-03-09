part of '../data_access_object.dart';

@immutable

/// A data access object for posts.
final class PostDataAccessObject extends DataAccessObject<Post> {
  /// Creates a new [PostDataAccessObject].
  const PostDataAccessObject(E621Client client) : super(client, 'posts');

  /// Upload a file from a URL.
  /// - [file] is The URL of the file to upload.
  /// - [tags] is a of list of tags.
  /// - [source]  This will be used as the post's 'Source' text. Limit of ten URLs.
  /// - [rating] is the rating for the post. Can be: [PostRating.safe], [PostRating.questionable] or [PostRating.explicit].
  /// - [description] is the description of the file.
  /// - [parentId] is the parent ID of the file.
  /// - [asPending] is whether the file should be pending.
  Future<({String location, int postId})> createFromUrl({
    required Uri file,
    required List<String> tags,
    List<Uri?> source = const [],
    PostRating rating = PostRating.explicit,
    String? description,
    int? parentId,
    bool? asPending,
  }) async {
    final Uri uri = Uri.https(super.host, 'uploads.json');

    if (source.isNotEmpty && source.length > 10) {
      source = source.sublist(0, 10);
    }

    final body = {
      'upload[direct_url]': file.toString(),
      'upload[tag_string]': tags.join(' '),
      'upload[source]': source.join(Platform.lineTerminator),
      'upload[rating]': rating.toString(),
      ...(description != null ? {'upload[description]': description} : {}),
      ...(parentId != null ? {'upload[parent_id]': parentId.toString()} : {}),
      ...(asPending != null
          ? {'upload[as_pending]': asPending.toString()}
          : {}),
    };

    final Response response;

    try {
      response = await client.post(uri, body: body);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.ok) {
      switch (response.statusCode) {
        case 422:
          throw E621DuplicateException(
              message: response.body,
              statusCode: response.statusCode,
              reasonPhrase: response.reasonPhrase);
        default:
          throw E621Exception(
              message: response.body,
              statusCode: response.statusCode,
              reasonPhrase: response.reasonPhrase);
      }
    }

    final Map<String, dynamic> json = jsonDecode(response.body);

    return (
      location: json['location'] as String,
      postId: json['post_id'] as int,
    );
  }

  /// Upload a file from a byte array.
  /// - [file] is The file data encoded as a byte array.
  /// - [tags] is a of list of tags.
  /// - [source]  This will be used as the post's 'Source' text. Limit of ten URLs.
  /// - [rating] is the rating for the post. Can be: [PostRating.safe], [PostRating.questionable] or [PostRating.explicit].
  /// - [description] is the description of the file.
  /// - [parentId] is the parent ID of the file.
  /// - [asPending] is whether the file should be pending.
  /// - [filename] is the name of the file.
  /// - [contentType] is the content type of the file (require [MediaType] from `http_parser` package.
  Future<({String location, int postId})> createFromFile({
    required List<int> file,
    required List<String> tags,
    List<Uri?> source = const [],
    PostRating rating = PostRating.explicit,
    String? description,
    int? parentId,
    bool? asPending,
    String? filename,
    MediaType? contentType,
  }) async {
    final MultipartFile multipartFile = MultipartFile.fromBytes(
        'upload[file]', file,
        filename: filename, contentType: contentType);

    final Uri uri = Uri.https(super.host, 'uploads.json');

    if (source.isNotEmpty && source.length > 10) {
      source = source.sublist(0, 10);
    }

    final request = MultipartRequest('POST', uri)
      ..fields['upload[tag_string]'] = tags.join(' ')
      ..fields['upload[source]'] = source.join(Platform.lineTerminator)
      ..fields['upload[rating]'] = rating.toString()
      ..fields['upload[description]'] = description ?? ''
      ..fields['upload[parent_id]'] = parentId?.toString() ?? ''
      ..fields['upload[as_pending]'] = asPending?.toString() ?? ''
      ..files.add(multipartFile);

    final StreamedResponse response;

    try {
      response = await client.send(request);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.ok) {
      switch (response.statusCode) {
        case 422:
          throw E621DuplicateException(
              message: await response.stream.bytesToString(),
              statusCode: response.statusCode,
              reasonPhrase: response.reasonPhrase);
        default:
          throw E621Exception(
              message: await response.stream.bytesToString(),
              statusCode: response.statusCode,
              reasonPhrase: response.reasonPhrase);
      }
    }

    final Map<String, dynamic> json =
        jsonDecode(await response.stream.bytesToString());

    return (
      location: json['location'] as String,
      postId: json['post_id'] as int,
    );
  }

  /// Update a post.
  /// - [id] is the ID of the post to update.
  /// - [tagStringDiff] is a list of tag changes such as `dog -cat`.
  /// - [sourceDiff] is a  list of source changes.
  /// - [parentId] is the new parent ID of the post.
  /// - [oldParentId] is the old parent ID of the post.
  /// - [description] is the new description of the post.
  /// - [oldDescription] should include the same descriptions submitted to [description] minus any intended changes.
  /// - [rating] is the new [PostRating] of the post.
  /// - [oldRating] is the old [PostRating]of the post.
  /// - [isRatingLocked] set to true to prevent others from changing the rating.
  /// - [isNoteLocked] set to true to prevent others from adding notes.
  /// - [editReason] is the reason for the submitted changes. Inline DText allowed
  Future<bool> update(
      {required int id,
      List<String>? tagStringDiff,
      List<Uri>? sourceDiff,
      int? parentId,
      int? oldParentId,
      String? description,
      String? oldDescription,
      PostRating? rating,
      PostRating? oldRating,
      bool? isRatingLocked,
      bool? isNoteLocked,
      required String editReason}) async {
    final Uri uri = Uri.https(super.host, 'posts/$id.json');

    final body = {
      ...(tagStringDiff != null
          ? {'post[tag_string_diff]': tagStringDiff.join(' ')}
          : {}),
      ...(sourceDiff != null
          ? {'post[source_diff]': sourceDiff.join(Platform.lineTerminator)}
          : {}),
      ...(parentId != null ? {'post[parent_id]': parentId.toString()} : {}),
      ...(oldParentId != null
          ? {'post[old_parent_id]': oldParentId.toString()}
          : {}),
      ...(description != null ? {'post[description]': description} : {}),
      ...(oldDescription != null
          ? {'post[old_description]': oldDescription}
          : {}),
      ...(rating != null ? {'post[rating]': rating.toString()} : {}),
      ...(oldRating != null ? {'post[old_rating]': oldRating.toString()} : {}),
      ...(isRatingLocked != null
          ? {'post[is_rating_locked]': isRatingLocked.toString()}
          : {}),
      ...(isNoteLocked != null
          ? {'post[is_note_locked]': isNoteLocked.toString()}
          : {}),
      'post[edit_reason]': editReason,
    };

    final Response response;

    try {
      response = await client.patch(uri, body: body);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.ok &&
        response.statusCode != HttpStatus.created) {
      throw E621Exception.fromResponse(response);
    }

    return true;
  }

  /// Gets a listing of posts
  /// - [limit] is the number of posts to get, must be between 1 and 320.
  /// - [tags] is the tags to filter by.
  /// - [page] is the page to get, must be between 1 and 750.
  Future<List<Post>> list(
      {int? limit = 320, List<String>? tags, int? page = 1}) async {
    if (limit != null) {
      limit = limit.clamp(1, 320);
    }

    if (page != null) {
      page = page.clamp(1, 750);
    }

    final Uri uri = Uri.https(super.host, '$_endpoint.json', {
      ...(limit != null ? {'limit': limit.toString()} : {}),
      ...(tags != null ? {'tags': tags.join(' ')} : {}),
      ...(page != null ? {'page': page.toString()} : {}),
    });

    Response response;

    try {
      response = await client.get(uri);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.ok) {
      throw E621Exception.fromResponse(response);
    }

    final List<dynamic> json = jsonDecode(response.body)['posts'];

    if (json.isEmpty) {
      return [];
    }

    return json
        .map((dynamic e) => fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  @internal
  Post fromJson(Map<String, dynamic> json) {
    return Post.fromMap(json);
  }
}
