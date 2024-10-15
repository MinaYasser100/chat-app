import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/home/presentation/manager/messages_cubit.dart';
import 'package:chat_app/features/home/presentation/views/widgets/receiver_message_item.dart';
import 'package:chat_app/features/home/presentation/views/widgets/sender_message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_home_text_form_field.dart';

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({super.key});

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView>
    with WidgetsBindingObserver {
  TextEditingController messageController = TextEditingController();
  final UserModel userModel = HiveHelper.getUserData();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = View.of(context).viewInsets.bottom;
    if (bottomInset > 0) {
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Expanded(
          child: BlocBuilder<MessagesCubit, MessagesState>(
            builder: (context, state) {
              if (state is MessagesLoaded && state.messages.isEmpty) {
                return const Center(
                  child: Text(
                    'لا توجد رسائل حتي الان , ابدا بالمحادثة و استمتع بوقتك',
                  ),
                );
              } else if (state is MessagesLoaded && state.messages.isNotEmpty) {
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    return message.sender.email == userModel.email
                        ? SenderMessageItem(messageModel: message)
                        : ReceiverMessageItem(messageModel: message);
                  },
                );
              } else if (state is MessagesError) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding:
              const EdgeInsets.only(top: 12, right: 10, left: 10, bottom: 20),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: CustomHomeTextFormField(
            textFieldModel: TextFieldModel(
              periprefixIcon: FontAwesomeIcons.solidPaperPlane,
              hintText: 'ارسل...',
              controller: messageController,
            ),
            suffixOnTap: () {
              if (messageController.text.isNotEmpty) {
                context.read<MessagesCubit>().sendMessage(
                      content: messageController.text,
                      sender: userModel,
                    );
                messageController.clear();
                _scrollToBottom();
              }
            },
          ),
        ),
      ],
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
