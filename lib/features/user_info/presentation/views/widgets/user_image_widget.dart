import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String userImage = Get.arguments as String;
    return Image(
      image: NetworkImage(userImage),
    );
  }
}
