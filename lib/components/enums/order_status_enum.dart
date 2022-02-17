Map<String, String> mapOrderStatusEnumtoString = {
  'unknown': 'Không rõ trạng thái',
  'pending': 'Đơn hàng mới',
  'verified': 'Đã tiếp nhận',
  'pickedUp': 'Đã lấy hàng',
  'completed': 'Hoàn thành',
  'refund': 'Hoàn tiền',
  'expired': 'Hết hạn',
  'paid': 'Đã thanh toán',
  'awaitingConfirm': 'Chờ xác nhận',
  'awaitingPickup': 'Chờ lấy hàng',
  'shipping': 'Đang giao hàng',
  'shipped': 'Đã giao hàng',
  'cancelled': 'Đã hủy',
  'processing': 'Đang xử lý',
  'failed': 'Thất bại',
  'packing': 'Đang đóng gói',
  'returned': 'Trả hàng',
  'firstPickupAttempt': 'Lấy hàng lần 1`',
  'secondPickupAttempt': 'Lấy hàng lần 2',
  'thirdPickupAttempt': 'Lấy hàng lần 3',
  'firstSendAttempt': 'Giao hàng lần 1',
  'secondSendAttempt': 'Giao hàng lần 2',
  'thirdSendAttempt': 'Giao hàng lần 3',
  'returning': 'Đang trả hàng về',
  'shippedFailed': 'Giao hàng thất bại',
  'pendingPaymentStatus': 'Chờ thanh toán',
  'requestPaymentStatus': 'Gửi yêu cầu thanh toán',
  'confirmedStatus': 'Chốt đơn',
  'waitingUserConfirmed': 'Chờ khách hàng xác nhận',
  'sentToLogistic': 'Bàn giao cho logistic',
};

Map<int, String> mapCompoundStatusToQueryString = {
  29: '3,10,15,17,18,19,20,21,22',
};

enum orderStatusEnum {
  unknown,
  pending,
  verified,
  pickedUp,
  completed,
  refund,
  expired,
  paid,
  awaitingConfirm,
  awaitingPickup,
  shipping,
  shipped,
  cancelled,
  processing,
  failed,
  packing,
  returned,
  firstPickupAttempt,
  secondPickupAttempt,
  thirdPickupAttempt,
  firstSendAttempt,
  secondSendAttempt,
  thirdSendAttempt,
  returning,
  shippedFailed,
  pendingPaymentStatus,
  requestPaymentStatus,
  confirmedStatus,
  waitingUserConfirmed,

  /// [sentToLogistic] is a compound status.
  /// Includes: 3, 10, 15, 17, 18, 19, 20, 21, 22 ||
  /// [pickedUp]
  /// [shipping]
  /// [packing]
  /// [firstPickupAttempt]
  /// [secondPickupAttempt]
  /// [thirdPickupAttempt]
  /// [firstSendAttempt]
  /// [secondSendAttempt]
  /// [thirdSendAttempt]
  /// Which originally under the duty of backend devs, but who care...
  sentToLogistic
}

extension OrderStatusEnumExtension on orderStatusEnum {
  String get enumToString {
    return mapOrderStatusEnumtoString[toString().split('.').last] ??
        mapOrderStatusEnumtoString[0]!;
  }

  orderStatusEnum intToEnum(int index) {
    // for normal status, current maximum is 28, ignoring the compounds
    if (index > 28) {
      return orderStatusEnum.unknown;
    }
    return orderStatusEnum.values[index];
  }

  String get enumToQueryString {
    if (index <= 28) {
      return index.toString();
    } else {
      return mapCompoundStatusToQueryString[index] ?? '0';
    }
  }
}
