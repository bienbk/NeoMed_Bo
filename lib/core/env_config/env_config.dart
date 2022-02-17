import 'package:mbo/core/core.dart';

class EnvConfig with MboLogger {
  const EnvConfig();

  String get sentryDsn => const String.fromEnvironment('sentry_dsn');

  bool get hasSentryDsn => const bool.hasEnvironment('sentry_dsn');

  bool validateAppConfig() {
    // ensure that all needed env variables are set.
    const valid = true;

    if (!hasSentryDsn) {
      log.warning('Missing sentry dsn, cannot report error to sentry.io.\n'
          'Make sure to add the sentry_dsn when building the app. \n\n'
          'For example: \n'
          'flutter run \\\n'
          '--dart-define=sentry_dsn=your_sentry_dsn \n\n');
    }

    return valid;
  }
}
