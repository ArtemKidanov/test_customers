import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_customers/src/presentation/controllers/home/home_controller.dart';
import 'package:test_customers/src/presentation/screens/home/widgets/user_card.dart';
import 'package:test_customers/src/presentation/widgets/error_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const screenName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _homeController = Get.find<HomeController>();

  @override
  void initState() {
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          _homeController.loadData();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: _homeController,
      initState: (state) {
        _homeController.loadData();
      },
      builder: (_) {
        final customers = _homeController.customers;
        final errorString = _homeController.errorString.value;

        if (errorString.isNotEmpty && customers.isEmpty) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: ErrorTextWidget(errorString),
          );
        }

        return Scaffold(
          appBar: _buildAppBar(),
          body: GridView.count(
            controller: _scrollController,
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            childAspectRatio: 0.8,
            children: List.from(customers)
                .map((user) => UserCard(user: user))
                .toList(),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Users screen'),
    );
  }
}
