import 'dart:io';

import 'package:test/test.dart';

import 'package:e621/e621.dart';

void main() {
  E621Client? client;

  group('Flag Data Access Object', () {
    setUp(() {
      List<String> env = File('.env.test').readAsLinesSync();

      client = E621Client(Uri.parse(env.first), env[1], env[2]);
    });

    test('Create a flag', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final response = await client!.flags.create(
        postId: 1,
        reason: 'Test',
      );

      expect(response, isNotNull);
      expect(response.id, isNotNull);
      expect(response.id, isA<int>());
    });

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
