import 'package:get/get.dart';
import 'package:test_customers/src/domain/entities/exceptions.dart';
import 'package:test_customers/src/domain/entities/user.dart';
import 'package:test_customers/src/domain/interactors/get_users_list_interactor.dart';

class HomeController extends GetxController {
  HomeController(this._getUsersListInteractor);

  final GetUsersListInteractor _getUsersListInteractor;

  final customers = RxList<User>([]);
  final errorString = Rx<String>('');

  Future<void> loadData() async {
    try {
      final users = await _getUsersListInteractor();

      customers.addAll(users);
    } on BaseException catch (e) {
      errorString.value = e.message;
    }
  }
}
