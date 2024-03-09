import 'dart:io';

import 'package:test/test.dart';

import 'package:e621/e621.dart';

void main() {
  E621Client? client;

  group('Flag Data Access Object', () {
    setUp(() {
      List<String> env = File('.env.test').readAsLinesSync();

      client = E621Client(
          host: Uri.parse(env.first),
          login: env[1],
          apiKey: env[2],
          userAgent:
              'E621 Dart Libray Test 0.0.1 / https://github.com/shalien/e621');
    });

    test('Create a flag', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final Post post = (await client!.posts.list(limit: 1)).first;

      final response = await client!.flags.create(
        postId: post.id,
        reason: 'inferior',
      );

      expect(response, isNotNull);
      expect(response.id, isNotNull);
      expect(response.id, isA<int>());
    }, skip: 'Always send back a 500 Server error');

    test('List flags', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final response = await client!.flags.list();

      expect(response, isNotNull);
      expect(response, isA<List<Flag>>());
    });

    tearDown(() {
      client?.close();
    });
  });
}
