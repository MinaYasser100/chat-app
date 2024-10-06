import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/features/home/presentation/views/widgets/sender_message_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_home_text_form_field.dart';

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({super.key});

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return const SenderMessageItem();
            },
          ),
        ),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding:
              const EdgeInsets.only(top: 12, right: 10, left: 10, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
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
            suffixOnTap: () {},
          ),
        ),
      ],
    );
  }
}
