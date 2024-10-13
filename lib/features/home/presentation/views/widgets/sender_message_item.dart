import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SenderMessageItem extends StatelessWidget {
  const SenderMessageItem({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6, right: 10, left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getFirstThreeWords(messageModel.sender.name),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    messageModel.content,
                    style: Styles.textStyle16Black,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              _formatTime12HourInArabic(messageModel.timestamp),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatTime12HourInArabic(DateTime dateTime) {
  // Set locale to Arabic ('ar') and format to 12-hour with AM/PM
  return DateFormat('hh:mm a', 'ar').format(dateTime);
}

String getFirstThreeWords(String name) {
  List<String> words = name.split(' ');
  String newName = words.take(3).join(' ');
  return newName;
}
