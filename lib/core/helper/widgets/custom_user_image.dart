import 'package:flutter/material.dart';

class CustomUserImage extends StatelessWidget {
  const CustomUserImage({
    super.key,
    required this.image,
    this.isBigImage = false,
  });

  final String image;
  final bool isBigImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: isBigImage ? 135 : 102,
        child: CircleAvatar(
          radius: isBigImage ? 130 : 97,
          backgroundImage: NetworkImage(image),
        ),
      ),
    );
  }
}
