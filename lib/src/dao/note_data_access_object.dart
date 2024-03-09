part of '../data_access_object.dart';

/// Allow to interact with notes.
final class NoteDataAccessObject extends DataAccessObject<Note> {
  /// Creates a new [NoteDataAccessObject].
  const NoteDataAccessObject(E621Client client) : super(client, 'notes');

  /// Returns a list of [Note]s.
  /// [bodyMatches]: A note body expression to match against, which can include `*` as a wildcard.
  /// [postId]: The ID of the [Post] the [Note] is on.
  /// [postTagsMatch]: The note's post's tags match the given terms. Meta-tags are not supported.
  /// [creatorName]: The creator's name. Exact match.
  /// [creatorId]: The creator's ID.
  /// [isActive]: Whether the note is active.
  /// [limit]: The limit of the number of notes to return.
  Future<List<Note>> list({
    String? bodyMatches,
    int? postId,
    String? postTagsMatch,
    String? creatorName,
    int? creatorId,
    bool? isActive,
    int? limit,
  }) async {
    // parameters except limit should be enclosed in search[] array
    final Uri uri = Uri.https(client.host.host, '$_endpoint.json', {
      ...(bodyMatches != null) ? {'search[body_matches]': bodyMatches} : {},
      ...(postId != null) ? {'search[post_id]': postId.toString()} : {},
      ...(postTagsMatch != null)
          ? {'search[post_tags_match]': postTagsMatch}
          : {},
      ...(creatorName != null) ? {'search[creator_name]': creatorName} : {},
      ...(creatorId != null)
          ? {'search[creator_id]': creatorId.toString()}
          : {},
      ...(isActive != null) ? {'search[is_active]': isActive.toString()} : {},
      ...(limit != null) ? {'limit': limit.toString()} : {},
    });

    final Response response;

    try {
      response = await client.get(uri);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => fromJson(e)).toList();
    } else {
      throw E621Exception.fromResponse(response);
    }
  }

  /// Creates a new [Note] on a [Post] using it's [postId].
  /// [postId] The [Post.id] of the [Post] you want to add a [Note] to.
  /// [x] he X coordinate of the top left corner of the [Note] in pixels from the top left of the [Post]
  /// [y] The Y coordinate of the top left corner of the [Note] in pixels from the top left of the [Post]
  /// [width] The width of the box for the [Note].
  /// [height] The height of the box for the [Note].
  /// [body] The content of the [Note].
  Future<Note> create({
    required int postId,
    required int x,
    required int y,
    required int width,
    required int height,
    required String body,
  }) async {
    final Uri uri = Uri.https(host, '$_endpoint.json');
    // every request field should be encased in note[] array
    final Map<String, dynamic> requestBody = {
      'note[post_id]': postId.toString(),
      'note[x]': x.toString(),
      'note[y]': y.toString(),
      'note[width]': width.toString(),
      'note[height]': height.toString(),
      'note[body]': body,
    };

    final Response response;

    try {
      response = await client.post(uri, body: requestBody);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode == HttpStatus.created ||
        response.statusCode == HttpStatus.ok) {
      return fromJson(jsonDecode(response.body));
    } else {
      throw E621Exception.fromResponse(response);
    }
  }

  /// Updates a [Note] using it's [id].
  /// [id] The [Note.id] of the [Note] you want to update.
  /// [x] he X coordinate of the top left corner of the [Note] in pixels from the top left of the [Post]
  /// [y] The Y coordinate of the top left corner of the [Note] in pixels from the top left of the [Post]
  /// [width] The width of the box for the [Note].
  /// [height] The height of the box for the [Note].
  /// [body] The content of the [Note].
  Future<Note> update({
    required int id,
    required int x,
    required int y,
    required int width,
    required int height,
    required String body,
  }) async {
    final Uri uri = Uri.https(client.host.host, '$_endpoint/$id.json');
    // every request field should be encased in note[] array
    final Map<String, dynamic> requestBody = {
      'note[x]': x.toString(),
      'note[y]': y.toString(),
      'note[width]': width.toString(),
      'note[height]': height.toString(),
      'note[body]': body,
    };

    final Response response;

    try {
      response = await client.put(uri, body: requestBody);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode == HttpStatus.ok) {
      return fromJson(jsonDecode(response.body));
    } else {
      throw E621Exception.fromResponse(response);
    }
  }

  /// Deletes a [Note] using it's [id].
  /// [id] The [Note.id] of the [Note] you want to delete.
  Future<bool> delete({required int id}) async {
    final Uri uri = Uri.https(client.host.host, '$_endpoint/$id.json');
    final Response response;

    try {
      response = await client.delete(uri);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.noContent) {
      throw E621Exception.fromResponse(response);
    }

    return true;
  }

  /// Reverts a [Note] to a previous version.
  /// [id] The [Note.id] of the [Note] you want to revert.
  /// [versionId] The version to revert to.
  Future<bool> revert({required int id, required int versionId}) async {
    final Uri uri = Uri.https(client.host.host, '$_endpoint/$id/revert.json');
    final Map<String, dynamic> requestBody = {
      'version_id': versionId.toString(),
    };

    final Response response;

    try {
      response = await client.post(uri, body: requestBody);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.noContent) {
      throw E621Exception.fromResponse(response);
    }

    return true;
  }

  @override
  Note fromJson(Map<String, dynamic> json) {
    return Note.fromMap(json);
  }
}
