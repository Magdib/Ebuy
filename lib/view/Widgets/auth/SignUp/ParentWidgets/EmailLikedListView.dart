import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Controller/authControllers/SignUpController.dart';
import '../ChildrenWidgets/EmailLikedRow.dart';

class EmailLikedListView extends StatelessWidget {
  const EmailLikedListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(
      builder: (controller) => SizedBox(
        height: controller.emailLikedList.length * 45,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.emailLikedList.length,
          itemBuilder: (context, index) {
            return EmailLikedRow(
              title: controller.emailLikedList[index].title,
              itemchosen: controller.emailLikedList[index].value,
              onTap: () => controller.chooseEmailLiked(index),
            );
          },
        ),
      ),
    );
  }
}
