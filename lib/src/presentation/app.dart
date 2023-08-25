import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_customers/src/presentation/routing/app_routes.dart';
import 'package:test_customers/src/presentation/screens/home/home_screen.dart';
import 'package:test_customers/src/presentation/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test application',
      theme: AppTheme().getAppTheme,
      initialRoute: HomeScreen.screenName,
      getPages: appRoutes,
    );
  }
}
