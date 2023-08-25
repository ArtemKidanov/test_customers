import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_customers/src/domain/entities/user.dart';
import 'package:test_customers/src/presentation/controllers/home/home_controller.dart';
import 'package:test_customers/src/presentation/screens/home/widgets/user_card.dart';
import 'package:test_customers/src/presentation/widgets/error_text_widget.dart';
import 'package:test_customers/src/presentation/widgets/loading_widget.dart';

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
        if (_scrollController.position.maxScrollExtent <
            _scrollController.position.pixels) {
          _homeController.loadData();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users screen'),
      ),
      body: GetX(
        init: _homeController,
        initState: (state) {
          _homeController.loadData();
        },
        builder: (_) {
          final users = _homeController.users;
          final errorString = _homeController.errorString.value;
          final isLoading = _homeController.isLoading.value;

          if (errorString.isNotEmpty && users.isEmpty) {
            return ErrorTextWidget(errorString);
          }

          return isLoading && users.isEmpty
              ? const LoadingWidget()
              : Stack(
                  children: [
                    _buildUsersGridView(users),
                    _buildPullLoader(isLoading),
                  ],
                );
        },
      ),
    );
  }

  Widget _buildUsersGridView(List<User> users) {
    return GridView.count(
      controller: _scrollController,
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      childAspectRatio: 0.8,
      physics: const BouncingScrollPhysics(),
      children: List.from(users).map((user) => UserCard(user: user)).toList(),
    );
  }

  Widget _buildPullLoader(bool isLoading) {
    return Positioned(
      bottom: 2,
      left: Get.width / 2,
      child: isLoading ? const LoadingWidget() : Container(),
    );
  }
}
