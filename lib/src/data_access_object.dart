import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:e621/e621.dart';
import 'package:e621/src/exception/e621_duplicate_exception.dart';
import 'package:e621/src/exception/e621_exception.dart';
import 'package:e621/src/utils/tag_implication_order.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';

part 'dao/favorite_data_access_object.dart';
part 'dao/flag_data_access_object.dart';
part 'dao/post_data_access_object.dart';
part 'dao/tag_data_access_object.dart';
part 'dao/tag_alias_data_access_object.dart';
part 'dao/tag_implication_data_access_object.dart';
part 'dao/vote_data_access_object.dart';
part 'dao/note_data_access_object.dart';

/// A data access object for the e621 API.
abstract class DataAccessObject<T extends Resource> {
  /// The client to use for requests.
  final E621Client client;

  /// The endpoint to use for requests.
  final String _endpoint;

  /// The base URL of the e621 API.
  String get host => client.host.host;

  /// Creates a new [DataAccessObject].
  const DataAccessObject(this.client, this._endpoint);

  @internal
  @mustBeOverridden

  /// Converts a map to a resource.
  T fromJson(Map<String, dynamic> json);
}
