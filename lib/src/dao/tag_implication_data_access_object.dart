part of '../core/data_access_object.dart';

@immutable

/// A data access object for tag implications.
final class TagImplicationDataAccessObject
    extends DataAccessObject<TagImplication> {
  /// Creates a new [TagImplicationDataAccessObject].
  const TagImplicationDataAccessObject(E621Client client)
      : super(client, 'tag_implications');

  /// Returns a list of tag Implicationes.
  /// - [nameMatches]: A tag name expression to match against, which can include `*` as a wildcard. Both the Implicationed-to and the Implicationed-by tag are matched.
  /// - [antecedentName]: Supports multiple tag names.
  /// - [consequentName]: Supports multiple tag names.
  /// - [antecedentTagCategory]: Supports multiple tag categories.
  /// - [consequentTagCategory]: Supports multiple tag categories.
  /// - [creatorName]: The name of the user who created the tag Implication.
  /// - [approverName]: The name of the user who approved the tag Implication.
  /// - [status]: The [TagImplicationStatus] of the tag Implication.
  ///   Can be either : [TagImplicationStatus.approved], [TagImplicationStatus.active], [TagImplicationStatus.pending], [TagImplicationStatus.deleted], [TagImplicationStatus.retired], [TagImplicationStatus.processing], [TagImplicationStatus.queued].
  /// - [limit]: The limit of the number of tag Implicationes to return.
  /// - [page]: The page number of the tag Implicationes to return.
  Future<List<TagImplication>> list(
      {String? nameMatches,
      List<String>? antecedentName,
      List<String>? consequentName,
      List<TagCategory>? antecedentTagCategory,
      List<TagCategory>? consequentTagCategory,
      String? creatorName,
      String? approverName,
      TagImplicationStatus? status,
      TagImplicationOrder? order = TagImplicationOrder.status,
      int? limit,
      String? page}) async {
    // all request field except limit and page should be encased in search[] array
    final Uri uri = Uri.https(client.host.host, '$_endpoint.json', {
      ...(nameMatches != null) ? {'search[name_matches]': nameMatches} : {},
      ...(antecedentName != null)
          ? {'search[antecedent_name]': antecedentName.join(',')}
          : {},
      ...(consequentName != null)
          ? {'search[consequent_name]': consequentName.join(',')}
          : {},
      ...(antecedentTagCategory != null)
          ? {
              'search[antecedent_tag_category]':
                  antecedentTagCategory.map((e) => e).join(',')
            }
          : {},
      ...(consequentTagCategory != null)
          ? {
              'search[consequent_tag_category]':
                  consequentTagCategory.map((e) => e).join(',')
            }
          : {},
      ...(creatorName != null) ? {'search[creator_name]': creatorName} : {},
      ...(approverName != null) ? {'search[approver_name]': approverName} : {},
      ...(status != null) ? {'search[status]': status} : {},
      ...(order != null) ? {'order': order.toString()} : {},
      ...(limit != null) ? {'limit': limit.toString()} : {},
      ...(page != null) ? {'page': page.toString()} : {},
    });

    final Response response;

    try {
      response = await client.get(uri);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.ok) {
      throw E621Exception.fromResponse(response);
    }

    final List<dynamic> data = json.decode(response.body) as List<dynamic>;

    return data
        .map((e) => TagImplication.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  @override
  TagImplication fromJson(Map<String, dynamic> json) {
    return TagImplication.fromMap(json);
  }
}
