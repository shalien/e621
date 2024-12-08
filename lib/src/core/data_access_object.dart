import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

import 'data_transfer_object.dart';

part '../dao/ip_bans_data_access_object.dart';
part '../mixins/indexable.dart';
part '../resources/ip_ban.dart';
part 'e621_client.dart';
part 'resource.dart';

/// A data access object for the e621 API.
abstract base class DataAccessObject<R extends Resource> {
  final Client _client;

  final String _baseUri;

  final Map<String, String>? _defaultHeaders;

  final Map<String, String>? _defaultQueryParameters;

  const DataAccessObject._(this._client, this._baseUri, this._defaultHeaders,
      this._defaultQueryParameters);

  R _fromJson(final Map<String, dynamic> json);
}
