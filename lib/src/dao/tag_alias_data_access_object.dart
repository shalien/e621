part of '../data_access_object.dart';

@immutable

/// A data access object for tag aliases.
final class TagAliasDataAccessObject extends DataAccessObject<TagAlias> {
  /// Creates a new [TagAliasDataAccessObject].
  const TagAliasDataAccessObject(E621Client client)
      : super(client, 'tag_aliases');

  /// Returns a list of tag aliases.
  /// - [nameMatches]: A tag name expression to match against, which can include `*` as a wildcard. Both the aliased-to and the aliased-by tag are matched.
  /// - [antecedentName]: Supports multiple tag names.
  /// - [consequentName]: Supports multiple tag names.
  /// - [antecedentTagCategory]: Supports multiple tag categories.
  /// - [consequentTagCategory]: Supports multiple tag categories.
  /// - [creatorName]: The name of the user who created the tag alias.
  /// - [approverName]: The name of the user who approved the tag alias.
  /// - [status]: The [TagAliasStatus] of the tag alias.
  ///   Can be either : [TagAliasStatus.approved], [TagAliasStatus.active], [TagAliasStatus.pending], [TagAliasStatus.deleted], [TagAliasStatus.retired], [TagAliasStatus.processing], [TagAliasStatus.queued].
  /// - [limit]: The limit of the number of tag aliases to return.
  /// - [page]: The page number of the tag aliases to return.
  Future<List<TagAlias>> list(
      {String? nameMatches,
      List<String>? antecedentName,
      List<String>? consequentName,
      List<TagCategory>? antecedentTagCategory,
      List<TagCategory>? consequentTagCategory,
      String? creatorName,
      String? approverName,
      TagAliasStatus? status,
      int? limit,
      String? page}) async {
    // all request field except limit and page should be encased in search[] array
    final Uri uri = Uri.https(client.host.host, '$_endpoint.json', {
      if (nameMatches != null) 'search[name_matches]': nameMatches,
      if (antecedentName != null)
        'search[antecedent_name]': antecedentName.join(','),
      if (consequentName != null)
        'search[consequent_name]': consequentName.join(','),
      if (antecedentTagCategory != null)
        'search[antecedent_tag_category]':
            antecedentTagCategory.map((e) => e).join(','),
      if (consequentTagCategory != null)
        'search[consequent_tag_category]':
            consequentTagCategory.map((e) => e).join(','),
      if (creatorName != null) 'search[creator_name]': creatorName,
      if (approverName != null) 'search[approver_name]': approverName,
      if (status != null) 'search[status]': status,
      if (limit != null) 'limit': limit.toString(),
      if (page != null) 'page': page,
    });

    final Response response;

    try {
      response = await client.get(uri);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != 200) {
      throw E621Exception.fromResponse(response);
    }

    final List<dynamic> data = json.decode(response.body) as List<dynamic>;

    return data
        .map((e) => TagAlias.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  @override
  TagAlias fromJson(Map<String, dynamic> json) {
    return TagAlias.fromMap(json);
  }
}
