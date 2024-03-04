
part of '../data_access_object.dart';

final class NoteDataAccessObject extends DataAccessObject<Note> {

  /// Creates a new [NoteDataAccessObject].
  const NoteDataAccessObject(E621Client client)
      : super(client, 'notes');


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
        ...(postTagsMatch != null) ? {'search[post_tags_match]': postTagsMatch} : {},
        ...(creatorName != null) ? {'search[creator_name]': creatorName} : {},
        ...(creatorId != null) ? {'search[creator_id]': creatorId.toString()} : {},
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

  @override
  Note fromJson(Map<String, dynamic> json) {
    return Note.fromMap(json);
  }

}