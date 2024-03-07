part of '../data_access_object.dart';

final class NoteDataAccessObject extends DataAccessObject<Note> {
  /// Creates a new [NoteDataAccessObject].
  const NoteDataAccessObject(E621Client client) : super(client, 'notes');

  /// Returns a list of notes.
  /// - [bodyMatches]: A note body expression to match against, which can include `*` as a wildcard.
  /// - [postId]: The ID of the post the note is on.
  /// - [postTagsMatch]: The note's post's tags match the given terms. Meta-tags are not supported.
  /// - [creatorName]: The creator's name. Exact match.
  /// - [creatorId]: The creator's ID.
  /// - [isActive]: Whether the note is active.
  /// - [limit]: The limit of the number of notes to return.
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

  Future<Post> create({
    required int postId,
    required int x,
    required int y,
    required int width,
    required int height,
    required String body,
  }) async {
    final Uri uri = Uri.https(client.host.host, '$_endpoint/$postId.json');
    // every request field should be encased in note[] array
    final Map<String, dynamic> requestBody = {
      'note[x]': x,
      'note[y]': y,
      'note[width]': width,
      'note[height]': height,
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
      return Post.fromMap(jsonDecode(response.body));
    } else {
      throw E621Exception.fromResponse(response);
    }
  }

  Future<Post> update({
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
      'note[x]': x,
      'note[y]': y,
      'note[width]': width,
      'note[height]': height,
      'note[body]': body,
    };

    final Response response;

    try {
      response = await client.put(uri, body: requestBody);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode == HttpStatus.ok) {
      return Post.fromMap(jsonDecode(response.body));
    } else {
      throw E621Exception.fromResponse(response);
    }
  }

  Future<bool> delete({required int postId}) async {
    final Uri uri = Uri.https(client.host.host, '$_endpoint/$postId.json');
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

  Future<bool> revert({required int postId, required int versionId}) async {
    final Uri uri =
        Uri.https(client.host.host, '$_endpoint/$postId/revert.json');
    final Map<String, dynamic> requestBody = {
      'version_id': versionId,
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
