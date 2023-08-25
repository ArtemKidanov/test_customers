import 'package:get/get.dart';
import 'package:test_customers/src/presentation/controllers/home/home_binding.dart';
import 'package:test_customers/src/presentation/controllers/user/user_binding.dart';
import 'package:test_customers/src/presentation/screens/home/home_screen.dart';
import 'package:test_customers/src/presentation/screens/user/user_screen.dart';

final appRoutes = [
  GetPage(
    name: HomeScreen.screenName,
    binding: HomeBinding(),
    page: () => HomeScreen(),
  ),
  GetPage(
    name: UserScreen.screenName,
    binding: UserBinding(),
    page: () => const UserScreen(),
    transition: Transition.downToUp,
  )
];
