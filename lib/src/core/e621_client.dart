part of 'data_access_object.dart';

/// A client for the e621 API.
class E621Client {
  final Client? _client;

  final String _baseUri;

  final Map<String, String>? _defaultHeaders;

  final Map<String, String>? _defaultQueryParameters;

  late final IPBansDataAccessObject ipBans = IPBansDataAccessObject._(
      _client!, _baseUri, _defaultHeaders, _defaultQueryParameters);

  E621Client._(
    this._baseUri,
    this._defaultHeaders,
    this._defaultQueryParameters, {
    final Client? client,
  }) : _client = client ?? Client();
}
