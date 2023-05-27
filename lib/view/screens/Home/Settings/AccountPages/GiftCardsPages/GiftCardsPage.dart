import 'package:ebuy/view/Widgets/Home/Settings/GiftCardWidgets/HandleGiftCards.dart';

import 'package:flutter/material.dart';

class GiftCardsPage extends StatelessWidget {
  const GiftCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gift cards & voucher',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: HandleGiftCards(anyCards: false),
      ),
    );
  }
}
