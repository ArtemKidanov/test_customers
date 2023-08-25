import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_customers/src/presentation/controllers/user/user_controller.dart';
import 'package:test_customers/src/presentation/widgets/error_text_widget.dart';
import 'package:test_customers/src/presentation/widgets/loading_widget.dart';

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});

  static const screenName = '/user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User screen'),
      ),
      body: GetX(
        init: controller,
        initState: (state) {
          controller.loadUser(Get.arguments as int);
        },
        builder: (_) {
          final user = controller.user.value;
          final isLoading = controller.isLoading.value;
          final errorString = controller.errorString.value;

          if (isLoading) {
            return const LoadingWidget();
          }

          if (errorString.isNotEmpty) {
            return ErrorTextWidget(errorString);
          }

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(user.avatar),
                const SizedBox(height: 16),
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text('ID: ${user.id}'),
                const SizedBox(height: 8),
                Text('Email: ${user.email}'),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          width: 350,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, _, __) => const ErrorTextWidget(
            'No internet connection. \nCan not load image.',
          ),
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
