import 'dart:io';

import 'package:e621/e621.dart';
import 'package:test/test.dart';

void main() async {
  E621Client? client;

  group('Vote Data Access Object', () {
    setUp(() {
      List<String> env = File('.env.test').readAsLinesSync();

      client = E621Client(
          host: Uri.parse(env.first),
          login: env[1],
          apiKey: env[2],
          userAgent:
              'E621 Dart Libray Test 0.0.1 / https://github.com/shalien/e621');
    });

    test('List votes', () async {
      final Post post = (await client!.posts.list(limit: 1)).first;

      final Vote response = await client!.votes.vote(postId: post.id, score: 1);

      expect(response, isNotNull);
      expect(response, isA<Vote>());
    });
  });
}
