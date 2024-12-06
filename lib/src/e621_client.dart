import 'dart:convert';

import 'package:http/http.dart';

import 'core/data_access_object.dart';

/// A client for the e621 API.
class E621Client extends BaseClient {
  /// The inner client to use for requests.
  final Client _inner;

  /// The base URL of the e621 API.
  final Uri host;

  /// The user agent to use for requests.
  final String userAgent;

  /// The login to use for requests.
  final String login;

  /// The API key to use for requests.
  final String apiKey;

  /// The authorization header to use for requests.
  String? _authHeader;

  /// The favorites data access object.
  late final FavoriteDataAccessObject favorites;

  /// The flags data access object.
  late final FlagDataAccessObject flags;

  /// The notes data access object.
  late final NoteDataAccessObject notes;

  /// The pool data access object.
  late final PoolDataAccessObject pools;

  /// The post data access object.
  late final PostDataAccessObject posts;

  /// The tag alias data access object.
  late final TagAliasDataAccessObject tagAliases;

  /// The tag data access object.
  late final TagDataAccessObject tags;

  /// The tag implication data access object.
  late final TagImplicationDataAccessObject tagImplications;

  /// The vote data access object.
  late final VoteDataAccessObject votes;

  /// Creates a new [E621Client].
  ///  [host] is the base URL of the imageboard you want to interact with.
  ///  [userAgent] is the user agent to use for requests, it's mandatory to provide one as a lot of website WILL REFUSE your request without ONE.
  ///  [client] is the client to use for requests, must be based on http [Client].
  E621Client(
      {required this.host,
      required this.login,
      required this.apiKey,
      required this.userAgent,
      Client? client})
      : _inner = client ?? Client() {
    favorites = FavoriteDataAccessObject(this);
    flags = FlagDataAccessObject(this);
    notes = NoteDataAccessObject(this);
    pools = PoolDataAccessObject(this);
    posts = PostDataAccessObject(this);
    tagAliases = TagAliasDataAccessObject(this);
    tags = TagDataAccessObject(this);
    tagImplications = TagImplicationDataAccessObject(this);
    votes = VoteDataAccessObject(this);

    if (userAgent.isEmpty) {
      throw ArgumentError('User agent SHOULD NOT be empty');
    }
  }

  /// Creates a new [E621Client] with the default e621 host (https://e621.net).
  E621Client.e621(
      {required login, required apiKey, required userAgent, Client? client})
      : this(
          host: Uri.parse('https://e621.net/'),
          login: login,
          apiKey: apiKey,
          userAgent: userAgent,
          client: client,
        );

  /// Creates a new [E621Client] with the default e926 host (https://e926.net).
  E621Client.e926(
      {required login, required apiKey, required userAgent, Client? client})
      : this(
          host: Uri.parse('https://e926.net/'),
          login: login,
          apiKey: apiKey,
          userAgent: userAgent,
          client: client,
        );

  /// Sends a request and returns a streamed response.
  /// [request] is the request to send.
  /// Will automatically add the user agent and authorization headers to every request the request.
  /// Returns a [StreamedResponse].
  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers['User-Agent'] = userAgent;
    request.headers['Authorization'] = _generateAuthHeader();

    return _inner.send(request);
  }

  /// Generates an authorization header for requests.
  String _generateAuthHeader() {
    return _authHeader ??=
        'Basic ${base64Encode(utf8.encode('$login:$apiKey'))}';
  }
}
