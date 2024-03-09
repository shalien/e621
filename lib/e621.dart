/// A client library for the API of imageboards using the e621 fork of gelbooru.
///
/// ## Features
///
/// - Implements all the endpoints of the e621 API : [e621 API](https://e621.net/help/show/api)
/// - Use Dart's native [`http`](https://pub.dev/packages/http) package for making requests alloowing for using more advanced [implementation](https://pub.dev/packages/http#choosing-an-implementation) on the fly.
///
/// ## Getting started
///
/// Add the package to your project by running the following command:
///
/// ```bash
/// # http is a required dependency since we rely on ClientException
/// dart pub add e621 http
/// ```
///
/// ## Usage
///
///
/// ```dart
/// // Simple example to collect last ten post and display link
///
/// import 'package:e621/e621.dart';
/// import 'package:http/http.dart';
///
/// Future<void> main() async {
///
///   /// You should see the `http`[https://pub.dev/packages/http#choosing-an-implementation](https://pub.dev/packages/http#choosing-an-implementation) package documentation for using an adequate [Client] for your platform
///   final E621Client client = E621Client(host: Uri.parse('https://e621.net'), login: 'username', apiKey: 'api_key', userAgent: 'MyApp/1.0 (by username on e621)');
///
///   final List<Post> posts;
///
///   try {
///
///     /// limit is optional but 10 will get the last 10 posts
///     posts = await client.posts.list(limit: 10);
///
///     /// [ClientException] is found in the `http` package
///     /// it will be throw in case something went wrong with the request AT the connection time
///   } on ClientException catch (e) {
///     print('Failed to get posts: $e');
///     return;
///
///     /// [E621Exception] is found in the `e621` package
///     /// It will throw is something went wrong with the request AFTER the connection time
///   } on E621Exception catch (e) {
///     print('Failed to get posts: $e');
///     return;
///   }
///
///   if (posts.isEmpty) {
///     print('No posts found');
///     return;
///   }
///
///   for (final post in posts) {
///     print('Post: ${post.id} - ${post.file.url}');
///   }
///
/// }
/// ```
///
///
/// ## No AI project / AI free Project
/// This project is written WITHOUT any AI assistance.
/// If you fork this project and use AI please remove this section.
///
///
/// ## Special Thanks
/// - **Dasa**: Your honesty and the morale boost to actually start this project.
///
library;

export 'src/e621_client.dart';
export 'src/resource.dart';
export 'src/data_access_object.dart';

/// Utilities
export '/src/utils/pool_category.dart';
export '/src/utils/pool_order.dart';
export '/src/utils/post_rating.dart';
export '/src/utils/tag_alias_order.dart';
export '/src/utils/tag_alias_status.dart';
export '/src/utils/tag_category.dart';
export '/src/utils/tag_implication_order.dart';
export '/src/utils/tag_implication_status.dart';
export '/src/utils/tag_order.dart';

/// Exceptions
export '/src/exception/e621_exception.dart';
