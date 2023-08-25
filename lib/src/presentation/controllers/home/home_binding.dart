import 'package:get/get.dart';
import 'package:test_customers/src/data/repositories/users_repository_impl.dart';
import 'package:test_customers/src/domain/interactors/get_users_list_interactor.dart';
import 'package:test_customers/src/presentation/controllers/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetUsersListInteractor(Get.find<UsersRepositoryImpl>()),
    );
    Get.lazyPut(() => HomeController(Get.find<GetUsersListInteractor>()));
  }
}
