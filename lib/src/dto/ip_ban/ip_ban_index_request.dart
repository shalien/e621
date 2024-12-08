part of '../../core/data_transfer_object.dart';

final class IpBanIndexRequest extends IndexRequestDataTransferObject {
  final String? ipAddr;

  final String? bannerId;

  final String? bannerName;

  final String? reason;

  const IpBanIndexRequest._({
    this.ipAddr,
    this.bannerId,
    this.bannerName,
    this.reason,
    super.limit,
    super.page,
    super.id,
    super.order,
  }) : super._();

  @override
  String toQueryParameters() {
    // TODO: implement toQueryParameters
    throw UnimplementedError();
  }
}
