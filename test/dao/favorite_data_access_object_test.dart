import 'dart:io';

import 'package:e621/e621.dart';
import 'package:test/test.dart';

void main() async {
  E621Client? client;

  group('Favorite Data Access object Test Group', () {
    setUp(() {
      List<String> env = File('.env.test').readAsLinesSync();

      client = E621Client(
        host: Uri.parse(env.first),
        login: env[1],
        apiKey: env[2],
        userAgent:
            'E621 Dart Libray Test 0.0.1 / https://github.com/shalien/e621',
      );
    });

    test('List favorites', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final response = await client!.favorites.list();

      expect(response, isNotNull);
      expect(response, isA<List<Post>>());
    });

    test('Create a new favorite', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final Post post = (await client!.posts.list(limit: 1)).first;

      final Post favoritedPost =
          await client!.favorites.create(postId: post.id);

      expect(favoritedPost, isNotNull);
      expect(favoritedPost.id, isNotNull);
      expect(favoritedPost.id, isA<int>());
      expect(favoritedPost.id, equals(post.id));
    });

    test('Delete a favorite', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final Post? post = (await client!.favorites.list()).firstOrNull;

      if (post == null) {
        throw Exception('No favorite to delete');
      }

      final bool response = await client!.favorites.delete(postId: post.id);

      expect(response, isTrue);
    });
  });
}
