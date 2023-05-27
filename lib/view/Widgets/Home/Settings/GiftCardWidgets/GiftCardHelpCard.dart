import 'package:ebuy/Controller/Home/SettingsControllers/AccountController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/CustomContainer.dart';
import '../../../shared/GreyDivider.dart';

class GiftCardHelpCard extends GetView<AccountControllerImp> {
  const GiftCardHelpCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Need help with these options?',
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: controller.giftCardList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Column(
                children: [
                  GestureDetector(
                    onTap: controller.giftCardList[index].onTap,
                    child: SizedBox(
                      height: 38,
                      child: ListTile(
                          dense: true,
                          title: Text(
                            controller.giftCardList[index].text,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          trailing: const Icon(Icons.arrow_forward)),
                    ),
                  ),
                  const GreyDivider(),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
