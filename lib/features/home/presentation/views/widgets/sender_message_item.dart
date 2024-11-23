import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SenderMessageItem extends StatefulWidget {
  const SenderMessageItem({
    super.key,
    required this.messageModel,
    required this.onPressedDelete,
  });
  final MessageModel messageModel;
  final void Function()? onPressedDelete;

  @override
  State<SenderMessageItem> createState() => _SenderMessageItemState();
}

class _SenderMessageItemState extends State<SenderMessageItem> {
  late bool isViewDeleteIcon;
  @override
  void initState() {
    isViewDeleteIcon = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        isViewDeleteIcon = true;
        if (mounted) {
          setState(() {});
        }

        await Future.delayed(const Duration(seconds: 5));

        if (mounted) {
          isViewDeleteIcon = false;
          setState(() {});
        }
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(top: 6, right: 10, left: 10, bottom: 2),
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
            if (isViewDeleteIcon)
              IconButton(
                onPressed: widget.onPressedDelete,
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
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
