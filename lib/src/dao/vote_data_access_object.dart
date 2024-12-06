part of '../core/data_access_object.dart';

/// A data access object for votes.
@immutable
final class VoteDataAccessObject extends DataAccessObject<Vote> {
  const VoteDataAccessObject(E621Client client) : super(client, 'votes');

  /// Vote on a post.
  /// - [postId] is the ID of the post to vote on.
  /// - [score] Set to 1 to vote up and -1 to vote down.
  /// - [noUnvote] Set to true to have this score replace the old score. Repeat votes will not remove the vote.
  Future<Vote> vote(
      {required int postId, required int score, bool? noUnvote = false}) async {
    final Uri uri = Uri.https(super.host, 'posts/$postId/$_endpoint.json');

    final Map<String, String> body = {
      'score': score.toString(),
      ...(noUnvote != null ? {'no_unvote': noUnvote.toString()} : {}),
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

    return fromJson(json);
  }

  @override
  Vote fromJson(Map<String, dynamic> json) {
    return Vote.fromMap(json);
  }
}
