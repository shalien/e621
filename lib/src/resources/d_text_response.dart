part of '../core/resource.dart';

final class DTextResponse extends Resource {
  final String html;

  final Map<int, DeferredPost> posts;

  const DTextResponse._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.html,
    required this.posts,
  }) : super._();

  DTextResponse._fromJson(super.json)
      : html = json['html'],
        posts = Map.fromEntries(
            json['posts'].map((e) => MapEntry(e[0], DeferredPost.fromJson(e)))),
        super._fromJson();

  factory DTextResponse.fromJson(final Map<String, dynamic> json) =>
      DTextResponse._fromJson(json);
}
