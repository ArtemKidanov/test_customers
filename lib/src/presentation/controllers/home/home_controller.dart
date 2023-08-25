import 'package:get/get.dart';
import 'package:test_customers/src/domain/entities/exceptions.dart';
import 'package:test_customers/src/domain/entities/user.dart';
import 'package:test_customers/src/domain/interactors/get_users_list_interactor.dart';

class HomeController extends GetxController {
  HomeController(this._getUsersListInteractor);

  final GetUsersListInteractor _getUsersListInteractor;

  final users = RxList<User>([]);
  final errorString = Rx<String>('');
  final isLoading = Rx<bool>(false);

  Future<void> loadData() async {
    isLoading.value = true;

    try {
      final users = await _getUsersListInteractor();

      this.users.addAll(users);
    } on BaseException catch (e) {
      errorString.value = e.message;
    }

    isLoading.value = false;
  }
}
