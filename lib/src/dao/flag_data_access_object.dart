part of '../data_access_object.dart';

@immutable

/// A data access object for flags.
final class FlagDataAccessObject extends DataAccessObject<Flag> {
  /// Creates a new [FlagDataAccessObject].
  const FlagDataAccessObject(E621Client client) : super(client, 'post_flags');

  /// Returns a list of flags.
  /// List maybe empty if no flags are found.
  /// - [postId] is the ID of the post to search for.
  /// - [creatorId] is the ID of the creator to search for.
  /// - [creatorName] is the name of the creator to search for.
  Future<List<Flag>> list(
      {int? postId, int? creatorId, String? creatorName}) async {
    final Map<String, String> queryParameters = {
      ...(postId != null ? {'search[post_id]': postId.toString()} : {}),
      ...(creatorId != null
          ? {'search[creator_id]': creatorId.toString()}
          : {}),
      ...(creatorName != null ? {'search[creator_name]': creatorName} : {}),
    };

    final Uri uri = Uri.https(super.host, '$_endpoint.json', queryParameters);

    final Response response;

    try {
      response = await client.get(uri);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != 200) {
      throw E621Exception(
          message: response.body,
          statusCode: response.statusCode,
          reasonPhrase: response.reasonPhrase);
    }

    final List<dynamic> json = jsonDecode(response.body);

    return json
        .map((dynamic e) => fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Creates a new flag.
  /// - [postId] is the ID of the post to flag.
  /// - [reason] is the reason for the flag.
  /// - [parentId] is the  ID of the superior post when flagging an image as inferior.
  ///  Will return the created flag.
  Future<Flag> create(
      {required int postId, required String reason, int? parentId}) async {
    final Uri uri = Uri.https(super.host, '$_endpoint.json');

    final Map<String, String> body = {
      'post_id': postId.toString(),
      'reason': reason,
      ...(parentId != null ? {'parent_id': parentId.toString()} : {}),
    };

    final Response response;

    try {
      response = await client.post(uri, body: body);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != 200) {
      throw E621Exception.fromResponse(response);
    }

    return fromJson(jsonDecode(response.body));
  }

  @override
  Flag fromJson(Map<String, dynamic> json) {
    return Flag.fromMap(json);
  }
}
