import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReceiverMessageItem extends StatefulWidget {
  const ReceiverMessageItem({
    super.key,
    required this.messageModel,
    this.onPressedDelete,
  });
  final MessageModel messageModel;
  final void Function()? onPressedDelete;

  @override
  State<ReceiverMessageItem> createState() => _ReceiverMessageItemState();
}

class _ReceiverMessageItemState extends State<ReceiverMessageItem> {
  late bool isViewDeleteIcon;
  late String? userEmail;

  @override
  void initState() {
    isViewDeleteIcon = false;
    userEmail = HiveHelper.getUserData().email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String senderEmail = widget.messageModel.sender.email;
    return GestureDetector(
      onLongPress: () async {
        if (mounted && senderEmail == userEmail) {
          isViewDeleteIcon = true;
          setState(() {});
        }
        await Future.delayed(
          const Duration(
            seconds: 5,
          ),
        );
        if (mounted) {
          isViewDeleteIcon = false;
          setState(() {});
        }
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isViewDeleteIcon)
              IconButton(
                onPressed: widget.onPressedDelete,
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                ),
              ),
            Container(
              margin:
                  const EdgeInsets.only(top: 6, right: 10, left: 10, bottom: 2),
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
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(GetPages.kUserInfoView,
                                arguments: widget.messageModel.sender);
                          },
                          child: Text(
                            getFirstThreeWords(widget.messageModel.sender.name),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          widget.messageModel.content,
                          style: Styles.textStyle16Black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Timestamp
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                            NetworkImage(widget.messageModel.sender.image),
                      ),
                      Text(
                        _formatTime12HourInArabic(
                            widget.messageModel.timestamp),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
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
