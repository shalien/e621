import 'dart:io';

import 'package:e621/e621.dart';
import 'package:test/test.dart';

void main() async {
  E621Client? client;

  group('Pool Data Access Object Test Group', () {
    setUp(() {
      List<String> env = File('.env.test').readAsLinesSync();

      client = E621Client(
          host: Uri.parse(env.first),
          login: env[1],
          apiKey: env[2],
          userAgent: 'E621 Dart Libray Test 0.0.1');
    });

    test('List pools', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final response = await client!.pools.list();

      expect(response, isNotNull);
      expect(response, isA<List<Pool>>());
    });

    test('Create a pool (not admin)', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      try {
        final response = await client!.pools.create(
          name: 'Test Pool',
          description: 'This is a test pool',
          category: PoolCategory.series,
        );

        expect(response, isNotNull);
        expect(response, isA<Pool>());
      } on E621Exception catch (e) {
        expect(e, isA<E621Exception>());
        expect(e.statusCode, 422);
      }
    });

    test('Create a pool (admin)', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final response = await client!.pools.create(
        name: 'Test Pool',
        description: 'This is a test pool',
        category: PoolCategory.series,
        isLocked: true,
      );

      expect(response, isNotNull);
      expect(response, isA<Pool>());
    }, skip: 'Admin only function');

    test('Update a pool', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final Pool pool = (await client!.pools.list()).first;

      final Pool newPool = pool.copyWith(
        name: 'Shalien\'s Test Pool',
        description: 'This is a test pool',
        category: PoolCategory.series,
      );
      try {
        final bool response = await client!.pools.update(
          id: pool.id,
          name: newPool.name,
          description: newPool.description,
          category: PoolCategory.series,
        );

        expect(response, isNotNull);
        expect(response, true);
      } on E621Exception catch (e) {
        expect(e, isA<E621Exception>());
        expect(e.statusCode, 422);
      }
    });

    test('Revert a pool', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final Pool pool = (await client!.pools.list()).first;

      final bool response =
          await client!.pools.revert(id: pool.id, versionId: 1);

      expect(response, isNotNull);
      expect(response, true);
    }, skip: 'Always return a 404 error');

    tearDown(() {
      client?.close();
    });
  });
}
