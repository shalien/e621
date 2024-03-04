import 'package:e621/src/exception/e621_exception.dart';
import 'package:meta/meta.dart';

@immutable

/// An exception thrown when a duplicate is found.
/// HTTP 422
final class E621DuplicateException extends E621Exception {
  /// Creates a new [E621DuplicateException].
  const E621DuplicateException(
      {required String message, required int statusCode, String? reasonPhrase})
      : super(
            message: message,
            statusCode: statusCode,
            reasonPhrase: reasonPhrase);
}
