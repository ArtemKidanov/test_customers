import 'package:test_customers/src/domain/entities/user.dart';
import 'package:test_customers/src/domain/interactors/base/no_param_interactor.dart';
import 'package:test_customers/src/domain/repositories/users_repository.dart';

class GetUsersListInteractor implements NoParamInteractor<List<User>> {
  GetUsersListInteractor(this._usersRepository);

  final UsersRepository _usersRepository;

  @override
  Future<List<User>> call() {
    return _usersRepository.getUsers();
  }
}
