import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_customers/src/data/models/page_response_model.dart';
import 'package:test_customers/src/domain/entities/user.dart';

class SharedPreferencesService extends GetxService {
  SharedPreferences? _sharedPreferences;

  static const String _usersPagesKey = 'users_page';

  Future<SharedPreferencesService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> saveUsersPage(PageResponseModel pageResponseModel) async {
    final usersSavedPagesStrings =
        _sharedPreferences?.getStringList(_usersPagesKey);
    if (usersSavedPagesStrings != null) {
      final usersSavedPages = usersSavedPagesStrings
          .map(
            (e) => PageResponseModel.fromJson(jsonDecode(e)),
          )
          .toList();
      final pageWithNumber = usersSavedPages
          .firstWhereOrNull((p) => p.page == pageResponseModel.page);

      if (pageWithNumber != null) {
        final indexOfPageWithNumber = usersSavedPages.indexOf(pageWithNumber);
        usersSavedPages.replaceRange(
          indexOfPageWithNumber,
          indexOfPageWithNumber + 1,
          [pageResponseModel],
        );
      } else {
        usersSavedPages.add(pageResponseModel);
      }

      await _sharedPreferences?.setStringList(
        _usersPagesKey,
        usersSavedPages
            .map(
              (page) => jsonEncode(page.toJson()),
            )
            .toList(),
      );
    } else {
      await _sharedPreferences?.setStringList(
          _usersPagesKey, [jsonEncode(pageResponseModel.toJson())]);
    }
  }

  PageResponseModel? getUserPage(int pageNumber) {
    final usersPagesList = _getAllUsersPages();

    return usersPagesList.firstWhereOrNull(
      (userPage) => userPage.page == pageNumber,
    );
  }

  User? getUserById(int id) {
    final usersPagesList = _getAllUsersPages();
    final users = <User>[];
    for (var userPage in usersPagesList) {
      users.addAll(userPage.data);
    }

    return users.firstWhereOrNull((user) => user.id == id);
  }

  List<PageResponseModel> _getAllUsersPages() {
    final usersPagesStringsList =
        _sharedPreferences?.getStringList(_usersPagesKey);

    if (usersPagesStringsList == null) {
      return [];
    }

    final usersPagesList = usersPagesStringsList
        .map(
          (pageResponseModel) => PageResponseModel.fromJson(
            jsonDecode(pageResponseModel),
          ),
        )
        .toList();

    return usersPagesList;
  }
}
