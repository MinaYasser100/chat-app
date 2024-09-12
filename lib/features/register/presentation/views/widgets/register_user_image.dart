import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterUserImage extends StatelessWidget {
  const RegisterUserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const CircleAvatar(
          radius: 104,
          backgroundColor: AppColors.primaryColor,
          child: CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/premium-vector/young-man-blue-jacket-is-holding-phone-man-blue-hoodie-is-looking-his-phone_1120557-36228.jpg?w=1060'),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            child: Icon(
              Icons.edit,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
