import 'package:get/get.dart';
import 'package:mbo/api/api.dart';
import 'package:mbo/components/models/distributor/distributors.dart';
import 'package:mbo/components/models/pagination.dart';
import 'package:mbo/core/core.dart';

class CommonController extends GetxController with MboLogger {
  var distributors =
      Distributors(distributors: [], pagination: Pagination()).obs;

  @override
  void onReady() {
    DistributorProvider.getDistributors(status: 1).then((value) {
      distributors.value = value;
      update();
    });
    super.onReady();
  }
}
