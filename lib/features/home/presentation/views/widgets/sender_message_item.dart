import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:flutter/material.dart';

class SenderMessageItem extends StatelessWidget {
  const SenderMessageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, right: 10, left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Timestamp
            Text(
              '02:34',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            // The message text should be flexible to wrap over multiple lines
            Flexible(
              child: Text(
                'sdgfasdjaskkdsjladflkjsdljfklajlfkjsd;kljf;klasjlfj;klasdj;fkljas;ldfja;kljfkljdkljfkdjkfhjkfjhj',
                style: Styles.textStyle16Black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
