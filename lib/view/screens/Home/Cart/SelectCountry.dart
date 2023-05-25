import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/shared/GreyDivider.dart';
import 'package:ebuy/view/Widgets/Home/Search/SearchTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_flags/country_flags.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SearchTextFiled(
              readOnly: false,
              onChanged: (value) {},
              suffixTap: () {},
              textController: TextEditingController(),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GetBuilder<CartControllerImp>(
                  builder: (controller) => ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                            title: Text('United States',
                                style: Theme.of(context).textTheme.bodyText1),
                            leading: SizedBox(
                                height: 24,
                                width: 24,
                                child: CountryFlags.flag('Us')),
                            trailing: const Icon(
                              Icons.check,
                              color: AppColors.primaryColor,
                            ),
                            contentPadding: const EdgeInsets.all(0),
                            minLeadingWidth: 20,
                          ),
                      itemCount: 12)),
            )
          ],
        ),
      ),
    );
  }
}
