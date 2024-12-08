part of '../core/resource.dart';

final class Help extends Resource {
  final String name;

  final String title;

  final String wikiPage;

  final String related;

  const Help._({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.name,
    required this.title,
    required this.wikiPage,
    required this.related,
  }) : super._();

  Help._fromJson(super.json)
      : name = json['name'],
        title = json['title'],
        wikiPage = json['wiki_page'],
        related = json['related'],
        super._fromJson();
}
