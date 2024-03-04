part of '../data_access_object.dart';

/// A data access object for favorites.
/// Unlike others DAO this one returns [Post] and no Favorite
@immutable
final class FavoriteDataAccessObject extends DataAccessObject<Post> {
  /// Creates a new [FavoriteDataAccessObject].
  const FavoriteDataAccessObject(E621Client client)
      : super(client, 'favorites');

  /// Returns a list of favorites [Post].
  /// List maybe empty if no favorites [Post] are found.
  /// - [userId] is the user to fetch the favorites from.
  /// If not specified will fetch the favorites from the currently authorized user.
  Future<List<Post>> list({int? userId}) async {
    final Uri uri = Uri.https(super.host, '$_endpoint.json', {
      ...(userId != null ? {'user_id': userId.toString()} : {}),
    });

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

    // Response is formatted with a "posts" array
    final List<dynamic> json = jsonDecode(response.body)['posts'];

    return json
        .map((dynamic e) => fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Creates a new favorite.
  /// - [postId] is the ID of the post to favorite.
  Future<Post> create({required int postId}) async {
    final Uri uri = Uri.https(super.host, '$_endpoint.json');

    final Map<String, String> body = {
      'post_id': postId.toString(),
    };

    final Response response;

    try {
      response = await client.post(uri, body: body);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != 200) {
      throw E621Exception(
          message: response.body,
          statusCode: response.statusCode,
          reasonPhrase: response.reasonPhrase);
    }

    /// Response is formatted with a "post" object
    final Map<String, dynamic> json = jsonDecode(response.body)['post'];

    return fromJson(json);
  }

  /// Deletes a favorite.
  /// - [postId] is the ID of the [Post]] to delete the favorite from.
  Future<bool> delete({required int postId}) async {
    final Uri uri = Uri.https(super.host, '$_endpoint/$postId.json');

    final Response response;

    try {
      response = await client.delete(uri);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw E621Exception.fromResponse(response);
    }

    return response.statusCode == 204;
  }

  @override
  Post fromJson(Map<String, dynamic> json) {
    return Post.fromMap(json);
  }
}
