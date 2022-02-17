import 'package:flutter/foundation.dart';

class ApiPath {
  static _Auth auth = _Auth();
  static _Base base = _Base();
  static _Report report = _Report();
  static _Distributor distributors = _Distributor();
  static _Order order = _Order();
  static _User user = _User();
  static _Product product = _Product();
}

class _Base {
  String get basePath => kReleaseMode
      ? 'https://api.neomed.vn/'
      : 'https://api.neomed.ciaolink.net/';
}

class _Auth {
  String get token => 'api/v1/auth/token';
  String get refreshToken => 'api/v1/auth/refresh-token';
}

class _Distributor {
  String get base => 'v1/distributors/';
  String get active => 'v1/distributors/active/';
}

class _Report {
  String get customersTx => 'v1/report/customers/tx';
  String get orders => 'v1/report/orders';
  String get ordersRevenuesHistogram => 'v1/report/orders/revenues/histogram';
  String get ordersRevenuesStatistic => 'v1/report/orders/revenues/statistic';
  String get ordersStatusHistogram => 'v1/report/orders/status/histogram';
  String get ordersStatusStatistic => 'v1/report/orders/status/statistic';
  String get salesPerformance => 'v1/report/sales/performance';
  String get vouchers => 'v1/report/vouchers';
  String get voucherHistogram => 'v1/report/vouchers/histogram';
  String get walletsBalance => 'v1/report/wallets/balance';
  String get walletCashin => 'v1/report/wallets/cashin';
  String get walletCashinHistogram => 'v1/report/wallets/cashin/histogram';
}

class _Order {
  String get base => 'v1/orders/';
  String get backOffices => 'v1/orders/back-offices';
  String get backOfficesListingStatus =>
      'v1/orders/back-offices/listing-status';
  String get backOfficesStatus => 'v1/orders/back-offices/status/';
  String get buyAgain => 'v1/orders/buy_again';
  String get itemsHistory => 'v1/orders/items/history';
  String get items => 'v1/orders/items/';
  String get paymentConfirm => 'v1/orders/payment-confirm';
  String get paymentRequest => 'v1/orders/payment-request';
  String get paymentRequestBiz => 'v1/orders/payment-request-biz';
  String get paymentById => 'v1/orders/payment/';
  String get payments => 'v1/orders/payments';
  String get stateHistories => 'v1/orders/state-histories/';
  String get userConfirm => 'v1/orders/user-confirm/';
}

class _User {
  String get base => 'api/v1/users/';
}

class _Product {
  String get base => 'v1/products/';
}
