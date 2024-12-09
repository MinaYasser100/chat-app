import 'package:flutter/material.dart';

import '../func/custom_divider.dart';
import 'custom_user_item_widget.dart';

class AllUsersBodyView extends StatelessWidget {
  const AllUsersBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      itemBuilder: (context, index) => const CustomUserItemWidget(),
      separatorBuilder: (context, index) => customDivider(),
      itemCount: 30,
    );
  }
}
