import 'package:get_it/get_it.dart';
import 'package:mbo/core/core.dart';

final app = GetIt.instance;

setupServices() {
  // register services
  app
    ..registerLazySingleton<EnvConfig>(() => const EnvConfig())
    ..registerLazySingleton<MessageService>(() => const MessageService())
    ..registerLazySingleton(() => DioService())
    ..registerLazySingleton(ConnectivityService.new)

    // preferences
    ..registerLazySingleton<MboSharedPreferences>(() => MboSharedPreferences())
    ..registerLazySingleton<GeneralPreferences>(
        () => const GeneralPreferences())
    ..registerLazySingleton<AuthPreferences>(() => const AuthPreferences());
}
