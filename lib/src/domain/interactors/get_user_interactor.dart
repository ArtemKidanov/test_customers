import 'package:test_customers/src/domain/entities/user.dart';
import 'package:test_customers/src/domain/interactors/base/interactor.dart';
import 'package:test_customers/src/domain/repositories/users_repository.dart';

class GetUserInteractor implements Interactor<User, int> {
  const GetUserInteractor(this._usersRepository);

  final UsersRepository _usersRepository;

  @override
  Future<User> call(int id) {
    return _usersRepository.getUserById(id);
  }
}
