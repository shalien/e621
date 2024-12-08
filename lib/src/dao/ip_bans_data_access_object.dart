part of '../core/data_access_object.dart';

@immutable
final class IPBansDataAccessObject extends DataAccessObject<IPBan>
    with Indexable<IpBanIndexRequest, IPBan> {
  const IPBansDataAccessObject._(
      final Client client,
      final String baseUri,
      final Map<String, String>? defaultHeaders,
      final Map<String, String>? defaultQueryParameters)
      : super._(
            client, '$baseUri/ip_bans', defaultHeaders, defaultQueryParameters);

  @override
  IPBan _fromJson(Map<String, dynamic> json) => IPBan._fromJson(json);
}
