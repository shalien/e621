part of '../data_access_object.dart';


final class PostDataAccessObject extends DataAccessObject<Post> {
  const PostDataAccessObject(E621Client client) : super(client, 'posts');

  Future<({String location, int postId})> uploadFile({
    required List<int> file,
    required List<String> tags,
    List<String?> source = const [],
    String rating = 'e',
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

    final request = MultipartRequest('POST', uri)
      ..fields['upload[tag_string]'] = tags.join(' ')
      ..fields['upload[source]'] = source.join(Platform.lineTerminator)
      ..fields['upload[rating]'] = rating
      //  ..fields['description'] = description ?? ''
      //  ..fields['parent_id'] = parentId?.toString() ?? ''
      //  ..fields['as_pending'] = asPending?.toString() ?? ''
      ..files.add(multipartFile);

    final response = await client.send(request);

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to upload file: ${response.statusCode} ${response.reasonPhrase} ${await response.stream.bytesToString()}');
    }

    final Map<String, dynamic> json =
        jsonDecode(await response.stream.bytesToString());

    return (
      location: json['location'] as String,
      postId: int.parse(json['post_id'])
    );
  }

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

    if (json.isEmpty) {
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
