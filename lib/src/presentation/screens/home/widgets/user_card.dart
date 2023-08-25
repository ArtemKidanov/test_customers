import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_customers/src/domain/entities/user.dart';
import 'package:test_customers/src/presentation/screens/user/user_screen.dart';
import 'package:test_customers/src/presentation/widgets/error_text_widget.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(UserScreen.screenName, arguments: user.id),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  height: 150,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, _, __) => const ErrorTextWidget(
                    'No internet connection. \nCan not load image.',
                  ),
                  image: NetworkImage(user.avatar),
                ),
              ),
              const SizedBox(height: 8),
              Text('${user.firstName} ${user.lastName}'),
              const SizedBox(height: 16),
              Text(
                user.email,
                style: Theme.of(context).textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
