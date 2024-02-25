import 'dart:io';

import 'package:test/test.dart';

import 'package:e621/e621.dart';

void main() {

  E621Client? client;

  group('Post Data Access Object', () {

    setUp(() {

      List<String> env = File('.env.test').readAsLinesSync();


      client = E621Client(Uri.parse(env.first), env[1], env[2]);
    });

    test('Insert Post', () {
      // Test code
    });

    test('Update Post', () {
      // Test code
    });

    test('Delete Post', () {
      // Test code
    });

    test('Get Post', () {
      // Test code
    });

    test('Get All Post', () async {

      if(client == null) {
        fail('Client is null');
      }

      List<Post> posts = await client!.posts.index();

      print('${client!.host.host} -  ${posts.length}');
      expect(posts.length, greaterThan(0));
    });


    test('Get All Post - Tag - Dasa', () async {

      if(client == null) {
        fail('Client is null');
      }

      List<String> tags = ['dasa'];

      List<Post> posts = await client!.posts.index(tags: tags);

      print('${client!.host.host} - KW : ${tags.join(' ')} - ${posts.length}');
      expect(posts.length, greaterThan(0));
    });

    test('Get All Post - Tags - Anal + Trans', () async {

      if(client == null) {
        fail('Client is null');
      }

      List<String> tags = ['anal', 'trans'];

      List<Post> posts = await client!.posts.index(tags: tags);

      print('${client!.host.host} - KW : ${tags.join(' ')} - ${posts.length}');
      expect(posts.length, greaterThan(0));
    });

    test('Get All Post - Tags - Anal + Dasa', () async {

      if(client == null) {
        fail('Client is null');
      }

      List<String> tags = ['anal', 'dasa'];

      List<Post> posts = await client!.posts.index(tags: tags);

      print('${client!.host.host} - KW : ${tags.join(' ')} - ${posts.length}');
      expect(posts.length, greaterThan(0));
    });



  });

}
