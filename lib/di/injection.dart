import 'package:fc_app/config.dart';
import 'package:fc_app/model/fortune_cookie_model.dart';
import 'package:fc_app/repositories/fortune_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  // API Service
  getIt.registerLazySingleton<FortuneApiService>(() => FortuneApiService());

  // Repository
  getIt.registerLazySingleton<FortuneRepository>(() {
    final apiService = getIt<FortuneApiService>();
    if (AppConfig.useMockData) {
      return MockFortuneRepository();
    } else {
      return ApiFortuneRepository(apiService);
    }
  });
}
