part of '../core/data_transfer_object.dart';

abstract base class IndexRequestDataTransferObject extends DataTransferObject {
  final int? limit;

  final int? page;

  final String? id;

  final Order? order;

  const IndexRequestDataTransferObject._({
    this.limit = 0,
    this.page = 1,
    this.id,
    this.order,
  }) : super._();

  @mustBeOverridden
  @mustCallSuper
  String toQueryParameters() => Uri(queryParameters: {
        'limit': limit.toString(),
        'page': page.toString(),
        'id': id ?? '',
        'order': order.toString(),
      }).query;
}
