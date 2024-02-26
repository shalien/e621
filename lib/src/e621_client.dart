import 'dart:convert';

import 'package:http/http.dart';

import 'const.dart';
import 'data_access_object.dart';

/// A client for the e621 API.
class E621Client extends BaseClient {
  /// The inner client to use for requests.
  final Client _inner;

  /// The base URL of the e621 API.
  final Uri host;

  /// The user agent to use for requests.
  final String? userAgent;

  /// The login to use for requests.
  final String login;

  /// The API key to use for requests.
  final String apiKey;

  String? _authHeader;

  late final PostDataAccessObject posts;

  /// Creates a new [E621Client].
  ///  - [host] is the base URL of the e621 API.
  ///  - [userAgent] is the user agent to use for requests.
  ///  - [client] is the client to use for requests, must be based on http [Client].
  E621Client(this.host, this.login, this.apiKey,
      {this.userAgent, Client? client})
      : _inner = client ?? Client() {
    posts = PostDataAccessObject(this);
  }

  /// Sends a request and returns a streamed response.
  /// - [request] is the request to send.
  /// Will automatically add the user agent and authorization headers to every request the request.
  /// - Returns a streamed response.
  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['User-Agent'] = userAgent ?? defaultUserAgent;
    request.headers['Authorization'] = _generateAuthHeader();

    return _inner.send(request);
  }

  /// Generates an authorization header for requests.
  String _generateAuthHeader() {
    return _authHeader ??=
        'Basic ${base64Encode(utf8.encode('$login:$apiKey'))}';
  }
}
