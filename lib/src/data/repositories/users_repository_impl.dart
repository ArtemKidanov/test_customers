import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_customers/src/data/services/shared_preferences_service.dart';
import 'package:test_customers/src/data/sources/network/api_client.dart';
import 'package:test_customers/src/domain/entities/exceptions.dart';
import 'package:test_customers/src/domain/entities/user.dart';
import 'package:test_customers/src/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this._apiClient, this._sharedPreferencesService);

  final ApiClient _apiClient;
  final SharedPreferencesService _sharedPreferencesService;

  int _pageNumber = 1;
  int _totalPagesCount = 0;

  @override
  Future<List<User>> getUsers() async {
    if (_totalPagesCount >= _pageNumber || _pageNumber == 1) {
      try {
        final usersPageResponse = await _apiClient.getUsers(_pageNumber);

        await _sharedPreferencesService.saveUsersPage(usersPageResponse);
      } on DioException catch (e) {
        printError(info: e.error.toString());
      } on Exception catch (e) {
        throw SomethingWentWrongException();
      }

      final localUsersPage = _sharedPreferencesService.getUserPage(_pageNumber);
      if (localUsersPage == null) {
        throw NoUsersPageFoundException();
      }
      _totalPagesCount = localUsersPage.totalPages;
      _pageNumber = localUsersPage.page + 1;

      return localUsersPage.data;
    }

    return [];
  }

  @override
  Future<User> getUserById(int id) async {
    try {
      final userResponseModel = await _apiClient.getUser(id);

      return userResponseModel.data;
    } on Exception catch (e) {
      final localUser = _sharedPreferencesService.getUserById(id);

      if (localUser == null) {
        throw NoUserFoundException();
      }

      return localUser;
    }
  }
}
