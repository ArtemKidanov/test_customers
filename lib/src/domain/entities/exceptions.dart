class BaseException implements Exception {
  const BaseException({required this.message});

  final String message;
}

class SomethingWentWrongException implements BaseException {
  @override
  String get message => 'Something went wrong. Please try again later.';
}

class NoUsersPageFoundException implements BaseException {
  @override
  String get message => 'Can not load data due to no internet connection '
      'and have no data locally saved.';
}

class NoUserFoundException implements BaseException {
  @override
  String get message =>
      'Can not load user data due to no internet connection and '
      'have no user data locally saved.';
}
