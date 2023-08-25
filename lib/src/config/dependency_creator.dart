import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_customers/src/data/repositories/users_repository_impl.dart';
import 'package:test_customers/src/data/sources/local/shared_preferences_service.dart';
import 'package:test_customers/src/data/sources/network/api_client.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => ApiClient(Get.find<Dio>()));
    Get.lazyPut(
      () => UsersRepositoryImpl(
        Get.find<ApiClient>(),
        Get.find<SharedPreferencesService>(),
      ),
    );
  }
}
