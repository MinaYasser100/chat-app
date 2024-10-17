import 'package:flutter/material.dart';

class CustomUserImage extends StatelessWidget {
  const CustomUserImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 102,
        child: CircleAvatar(
          radius: 97,
          backgroundImage: NetworkImage(image),
        ),
      ),
    );
  }
}
