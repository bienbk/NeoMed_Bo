import 'package:mbo/core/core.dart';

class GeneralPreferences {
  const GeneralPreferences();

  /// Whether the user has consented to send automatic crash reports.
  bool get crashReports =>
      app<MboSharedPreferences>().getBool('crashReports', true);
  set crashReports(bool value) =>
      app<MboSharedPreferences>().setBool('crashReports', value);
}
