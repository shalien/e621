import 'package:meta/meta.dart';

import '../enums/order.dart';

part '../dto/index_request_data_transfer_object.dart';
part '../dto/ip_ban/ip_ban_index_request.dart';

@immutable
abstract base class DataTransferObject {
  const DataTransferObject._();
}
