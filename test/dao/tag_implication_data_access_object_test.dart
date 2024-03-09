import 'dart:io';

import 'package:e621/e621.dart';
import 'package:test/test.dart';

void main() async {
  E621Client? client;

  group('Tag Implication Data Access Object', () {
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

    test('List tag Implications', () async {
      final response = await client!.tagImplications.list();

      expect(response, isNotNull);
      expect(response, isA<List<TagImplication>>());
    });
  });
}
