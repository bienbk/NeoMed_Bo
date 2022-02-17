import 'package:mbo/core/core.dart';

import 'mbo.dart';

void main() async {
  // init state and dependencies;
  await setupServices();
  MboErrorHandler(child: const Mbo());
}
