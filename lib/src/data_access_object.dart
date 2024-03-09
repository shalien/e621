import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'utils/pool_category.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';

import 'e621_client.dart';
import 'exception/e621_duplicate_exception.dart';
import 'exception/e621_exception.dart';
import 'resource.dart';
import 'utils/pool_order.dart';
import 'utils/post_rating.dart';
import 'utils/tag_alias_status.dart';
import 'utils/tag_category.dart';
import 'utils/tag_implication_order.dart';
import 'utils/tag_implication_status.dart';
import 'utils/tag_order.dart';

part 'dao/favorite_data_access_object.dart';
part 'dao/flag_data_access_object.dart';
part 'dao/note_data_access_object.dart';
part 'dao/pool_data_access_object.dart';
part 'dao/post_data_access_object.dart';
part 'dao/tag_alias_data_access_object.dart';
part 'dao/tag_data_access_object.dart';
part 'dao/tag_implication_data_access_object.dart';
part 'dao/vote_data_access_object.dart';

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
