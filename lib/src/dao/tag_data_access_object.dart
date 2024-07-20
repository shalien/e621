part of '../data_access_object.dart';

@immutable

/// A data access object for tags.
final class TagDataAccessObject extends DataAccessObject<Tag> {
  /// Creates a new [TagDataAccessObject].
  const TagDataAccessObject(E621Client client) : super(client, 'tags');

  /// Returns a list of tags.
  /// - [nameMatches] is a tag name expression to match against, which can include `*` as a wildcard.
  /// - [category] is the category of the tag.
  /// - [order]  Changes the sort order. Pass one of [TagOrder.date] (default), [TagOrder.count], or [TagOrder.name].
  /// - [hideEmpty]  Hide tags with zero visible posts. Defaults to `true`.
  /// - [hasWiki]  Set to `true` to only return tags with a wiki page.
  /// - [hasArtist]  Set to `true` to only return tags with an artist.
  /// - [limit]  The number of tags to return. Defaults to 75. Hard upper limit of 320.
  /// - [page]  The page number to return. Can also be used with a or b + tag_id to get the tags after or before the specified tag ID. For example a13 gets every tag after tag_id 13 up to the limit. This overrides the specified search ordering, [TagOrder.date] is always used instead.
  Future<List<Tag>> list(
      {String? nameMatches,
      TagCategory? category,
      TagOrder? order = TagOrder.date,
      bool? hideEmpty = true,
      bool? hasWiki,
      bool? hasArtist,
      int? limit = 75,
      String? page}) async {
    if (limit != null) {
      limit = limit.clamp(1, 320);
    }

    final Uri uri = Uri.https(super.host, '$_endpoint.json', {
      ...(nameMatches != null ? {'search[name_matches]': nameMatches} : {}),
      ...(category != null ? {'search[category]': category.toString()} : {}),
      ...(order != null ? {'search[order]': order.toString()} : {}),
      ...(hideEmpty != null
          ? {'search[hide_empty]': hideEmpty.toString()}
          : {}),
      ...(hasWiki != null ? {'search[has_wiki]': hasWiki.toString()} : {}),
      ...(hasArtist != null
          ? {'search[has_artist]': hasArtist.toString()}
          : {}),
      ...(limit != null ? {'limit': limit.toString()} : {}),
      ...(page != null ? {'page': page} : {}),
    });

    final Response response;

    try {
      response = await client.get(uri);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.ok) {
      throw E621Exception(
          message: response.body,
          statusCode: response.statusCode,
          reasonPhrase: response.reasonPhrase);
    }

    final decoded = jsonDecode(response.body);

    if (decoded is List) {
      return decoded
          .map((dynamic e) => fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return const [];
    }
  }

  @override
  Tag fromJson(Map<String, dynamic> json) {
    return Tag.fromMap(json);
  }
}
