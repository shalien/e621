import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:test/test.dart';

import 'package:e621/e621.dart';

void main() {
  E621Client? client;

  group('Post Data Access Object', () {
    setUp(() {
      List<String> env = File('.env.test').readAsLinesSync();

      client = E621Client(
        host: Uri.parse(env.first),
        login: env[1],
        apiKey: env[2],
        userAgent: 'E621 Dart Libray Test 0.0.1',
      );
    });

    test('Create a post from file', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final File file = File('test/resources/test.jpg');
      if (!file.existsSync()) {
        throw Exception('File does not exist');
      }

      final response = await client!.posts.createFromFile(
        file: file.readAsBytesSync(),
        contentType: MediaType('image', 'jpeg'),
        tags: ['test'],
        rating: PostRating.explicit,
      );

      expect(response.location, isNotEmpty);
      expect(response.postId, isNotNull);
      expect(response.postId, isA<int>());
    }, skip: 'Unable to test without a test website');

    test('Create a fil from Url', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final response = await client!.posts.createFromUrl(
        file: Uri.parse(
            'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png'),
        tags: ['test'],
        rating: PostRating.explicit,
      );

      expect(response.location, isNotEmpty);
      expect(response.postId, isNotNull);
      expect(response.postId, isA<int>());
    }, skip: 'Unable to test without a test website');

    test('Update a post', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final response = await client!.posts.update(
        id: 1,
        editReason: "Test",
      );

      expect(response, isNotNull);
      expect(response, true);
    }, skip: 'Unable to test without a test website');

    test('List posts', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final response = await client!.posts.list(
        limit: 1,
      );

      expect(response, isNotNull);
      expect(response, isNotEmpty);
      expect(response.length, 1);
    });

    tearDown(() {
      client?.close();
    });
  });
}
