part of '../core/data_access_object.dart';

base mixin Indexable<I extends IndexRequestDataTransferObject,
    R extends Resource> on DataAccessObject<R> {
  Future<R> index(covariant I dto) async {
    final Uri uri = Uri.parse('$_baseUri.json?${dto.toQueryParameters()}');

    late final Response response;

    try {
      response = await _client.get(uri, headers: _defaultHeaders);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != 200) {
      throw Exception();
    }

    return _fromJson(jsonDecode(response.body));
  }
}
