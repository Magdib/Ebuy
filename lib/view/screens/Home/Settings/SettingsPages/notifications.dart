import 'package:ebuy/Controller/Home/AccountController.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            children: [
              CustomContainer(
                  height: 72,
                  radius: 5,
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sales and promotions',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      GetBuilder<AccountControllerImp>(
                          builder: (controller) => Switch(
                              value: controller.sendNotificatios,
                              onChanged: (val) =>
                                  controller.notificationState(val)))
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                'You can changes your communication preferences, including email and SMS, from My account ',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 12),
              )
            ],
          )),
    );
  }
}
