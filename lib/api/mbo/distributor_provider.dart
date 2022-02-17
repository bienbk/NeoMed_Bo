import 'package:mbo/api/api.dart';
import 'package:mbo/components/models/distributor/distributors.dart';
import 'package:mbo/core/core.dart';

class DistributorProvider {
  static Future<Distributors> getDistributors(
          {int? size, int? page, int? status}) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.distributors.base,
              queryParameters: {'size': size, 'page': page, 'status': status}
                ..removeWhere((key, value) => value == null))
          .then((value) => Distributors.fromJson(value.data));
}
