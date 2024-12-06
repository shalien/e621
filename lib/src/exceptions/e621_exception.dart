import 'package:http/http.dart';
import 'package:meta/meta.dart';

@immutable

/// An exception thrown by the e621 API.
base class E621Exception implements Exception {
  /// The message of this exception.
  final String message;

  /// The reason phrase of this exception.
  final String? reasonPhrase;

  /// The status code of this exception.
  final int statusCode;

  /// Creates a new [E621Exception].
  const E621Exception(
      {required this.message, required this.statusCode, this.reasonPhrase});

  /// Creates a new [E621Exception] from a [Response].
  factory E621Exception.fromResponse(Response response) {
    return E621Exception(
      message: response.body,
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase,
    );
  }

  @override
  String toString() =>
      'E621Exception: $message\nStatus code: $statusCode\nReason phrase: $reasonPhrase';
}
