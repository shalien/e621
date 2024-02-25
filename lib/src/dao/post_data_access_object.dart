part of '../data_access_object.dart';

final class PostDataAccessObject extends DataAccessObject<Post> {
  const PostDataAccessObject(E621Client client) : super(client, 'posts');

  /// Gets a lisiting of posts
  /// - [limit] is the number of posts to get, must be between 1 and 320.
  /// - [tags] is the tags to filter by.
  /// - [page] is the page to get, must be between 1 and 750.
  Future<List<Post>> index(
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

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to get posts: ${response.statusCode} ${response.reasonPhrase}');
    }

    final List<dynamic> json = jsonDecode(response.body)['posts'];

    if(json.isEmpty) {
      return [];
    }

    return json
        .map((dynamic e) => fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Post fromJson(Map<String, dynamic> json) {
    return Post.fromMap(json);
  }
}
