// Simple example to collect last ten post and display link

import 'package:e621/e621.dart';
import 'package:http/http.dart';

Future<void> main() async {
  /// You should see the `http`[https://pub.dev/packages/http#choosing-an-implementation](https://pub.dev/packages/http#choosing-an-implementation) package documentation for using an adequate [Client] for your platform
  final E621Client client = E621Client(
      host: Uri.parse('https://e621.net'),
      login: 'username',
      apiKey: 'api_key',
      userAgent: 'MyApp/1.0 (by username on e621)');

  final List<Post> posts;

  try {
    /// limit is optional but 10 will get the last 10 posts
    posts = await client.posts.list(limit: 10);

    /// [ClientException] is found in the `http` package
    /// it will be throw in case something went wrong with the request AT the connection time
  } on ClientException catch (e) {
    print('Failed to get posts: $e');
    return;

    /// [E621Exception] is found in the `e621` package
    /// It will throw is something went wrong with the request AFTER the connection time
  } on E621Exception catch (e) {
    print('Failed to get posts: $e');
    return;
  }

  if (posts.isEmpty) {
    print('No posts found');
    return;
  }

  for (final post in posts) {
    print('Post: ${post.id} - ${post.file.url}');
  }
}
