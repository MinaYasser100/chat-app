import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceiverMessageItem extends StatelessWidget {
  const ReceiverMessageItem({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, right: 10, left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
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
            // Timestamp
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
