import 'package:mbo/api/api.dart';
import 'package:mbo/components/models/product.dart';
import 'package:mbo/core/core.dart';

class ProductProvider {
  static Future<Product> getBo({
    required String id,
    String? customerId,
    String? quantity,
  }) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.product.base + id + '/bo',
              queryParameters: {
                'customerId': customerId,
                'quantity': quantity,
              }..removeWhere((key, value) => value == null))
          .then((value) {
        var result = Product.fromJson(value.data);
        return result;
      });
}
