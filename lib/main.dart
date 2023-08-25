import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_customers/src/config/dependency_creator.dart';
import 'package:test_customers/src/data/services/shared_preferences_service.dart';
import 'package:test_customers/src/presentation/app.dart';

Future<void> main() async {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const App());
}

Future<void> initServices() async {
  await Get.putAsync(() => SharedPreferencesService().init());
}
