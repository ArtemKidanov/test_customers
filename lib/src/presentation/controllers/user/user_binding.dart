import 'package:get/get.dart';
import 'package:test_customers/src/data/repositories/users_repository_impl.dart';
import 'package:test_customers/src/domain/interactors/get_user_interactor.dart';
import 'package:test_customers/src/presentation/controllers/user/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetUserInteractor(Get.find<UsersRepositoryImpl>()),
    );
    Get.lazyPut(() => UserController(Get.find<GetUserInteractor>()));
  }
}
