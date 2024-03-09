import 'dart:io';

import 'package:e621/e621.dart';
import 'package:test/test.dart';

void main() async {
  E621Client? client;

  group('Note Data Access object Test Group', () {
    setUp(() {
      List<String> env = File('.env.test').readAsLinesSync();

      client = E621Client(
          host: Uri.parse(env.first),
          login: env[1],
          apiKey: env[2],
          userAgent: 'E621 Dart Libray Test 0.0.1');
    });

    test('List notes', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final response = await client!.notes.list();

      expect(response, isNotNull);
      expect(response, isA<List<Note>>());
    });

    test('Create a new note', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final Post post = (await client!.posts.list(limit: 1)).first;

      final Note note = await client!.notes.create(
        postId: post.id,
        x: 0,
        y: 0,
        width: 100,
        height: 100,
        body: 'This is a test note',
      );

      expect(note, isNotNull);
      expect(note.id, isNotNull);
      expect(note.id, isA<int>());
    });

    test('Update a note', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final Note note = (await client!.notes.list(limit: 1)).first;

      final Note newNote = note.copyWith(
        x: 0,
        y: 0,
        width: 200,
        height: 150,
        body: 'This is a updated note',
      );

      final updatedNote = await client!.notes.update(
        id: note.id,
        x: newNote.x,
        y: newNote.y,
        width: newNote.width,
        height: newNote.height,
        body: newNote.body,
      );

      expect(updatedNote, isNotNull);
      expect(updatedNote.id, isNotNull);
      expect(updatedNote.id, isA<int>());
      expect(updatedNote.id, equals(note.id));
      expect(updatedNote.x, equals(newNote.x));
      expect(updatedNote.y, equals(newNote.y));
      expect(updatedNote.width, equals(newNote.width));
      expect(updatedNote.height, equals(newNote.height));
      expect(updatedNote.body, equals(newNote.body));
    });

    test('Revert a note', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final Note note = (await client!.notes.list(limit: 1)).first;

      final int versionId = 1;

      final bool isReverted = await client!.notes.revert(
        id: note.id,
        versionId: versionId,
      );

      expect(isReverted, isNotNull);
      expect(isReverted, isTrue);
    }, skip: 'Always send back a 404 not found');

    test('Delete a note', () async {
      if (client == null) {
        throw Exception('Client is null');
      }

      final Note note = (await client!.notes.list(limit: 1)).first;

      final bool isDeleted = await client!.notes.delete(
        id: note.id,
      );

      expect(isDeleted, isNotNull);
      expect(isDeleted, isTrue);
    });

    tearDown(() {
      client?.close();
    });
  });
}
