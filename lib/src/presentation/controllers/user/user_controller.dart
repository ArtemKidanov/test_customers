import 'package:get/get.dart';
import 'package:test_customers/src/domain/entities/exceptions.dart';
import 'package:test_customers/src/domain/entities/user.dart';
import 'package:test_customers/src/domain/interactors/get_user_interactor.dart';

class UserController extends GetxController {
  UserController(this._getUserInteractor);

  final GetUserInteractor _getUserInteractor;

  final user = Rx<User>(User.empty());
  final errorString = Rx<String>('');
  final isLoading = Rx<bool>(false);

  Future<void> loadUser(int id) async {
    try {
      isLoading.value = true;

      final user = await _getUserInteractor(id);
      this.user.value = user;

      isLoading.value = false;
    } on BaseException catch (e) {
      errorString.value = e.message;
    }
  }
}
