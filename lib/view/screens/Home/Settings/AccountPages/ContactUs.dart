import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/Home/Settings/AccountSettings/AccountPageFCard.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/Colors.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Contact Us', context, 4),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(
                    left: handleContactUs('leftMargin', index),
                    right: handleContactUs('', index)),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: handleContactUs('Color', index),
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16.0),
                      topRight: const Radius.circular(16.0),
                      bottomLeft: handleContactUs('leftRadius', index),
                      bottomRight: handleContactUs('rightRadius', index)),
                ),
                child: Text(messages[index],
                    style: Theme.of(context).textTheme.headline3),
              ),
              itemCount: 4,
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2.5),
            child: TextField(
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  prefixIconColor: AppColors.primaryColor,
                  hintText: "Write your letter here...",
                  hintStyle: Theme.of(context).textTheme.headline2,
                  filled: true,
                  fillColor: AppColors.veryLightGrey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none)),
            ),
          ),
        ],
      ),
    );
  }
}

List<bool> s = [true, false, true, false];
List<String> messages = [
  'Hello, can you tell me how to buy a product?',
  'of course, you can buy any product by adding it to the cart and continue by check out.',
  'thank you',
  'Welcome, we are always ready to help our customers.'
];
handleContactUs(String type, int index) {
  if (type == 'Color') {
    return s[index] == true ? AppColors.primaryColor : AppColors.blue;
  } else if (type == 'rightRadius') {
    return s[index] == false ? const Radius.circular(16.0) : Radius.zero;
  } else if (type == 'leftRadius') {
    return s[index] == true ? const Radius.circular(16.0) : Radius.zero;
  } else if (type == 'leftMargin') {
    return s[index] == true ? UINumber.deviceWidth / 3.0 : 0.0;
  } else {
    return s[index] == false ? UINumber.deviceWidth / 3.0 : 0.0;
  }
}
