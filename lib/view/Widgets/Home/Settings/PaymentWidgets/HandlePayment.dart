import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/AppWords.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/shared/CustomPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/CustomContainer.dart';
import '../../Cart/checkOut/payment/NoPaymentCard.dart';

class HandlePayment extends StatelessWidget {
  const HandlePayment({super.key, required this.paymentState});
  final PaymentState paymentState;

  @override
  Widget build(BuildContext context) {
    return paymentState == PaymentState.noMethod
        ? ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: [
              Text(
                'You curently have no saved paymend method. Get stard by adding one.',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomContainer(
                  radius: 5,
                  height: 140,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: ListView.separated(
                      padding:
                          const EdgeInsets.only(top: 30, left: 10, bottom: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {},
                            child: const NoPaymentCard(),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 30,
                          ),
                      itemCount: 3)),
              Text(
                'Need help with these options?',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomContainer(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: GestureDetector(
                  onTap: () => print(AppWords.websiteWord),
                  child: SizedBox(
                    height: 38,
                    child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 5),
                        minVerticalPadding: 0,
                        dense: true,
                        title: Text(
                          'What is 4 eassy payments with Klarna?',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        trailing: const Icon(Icons.arrow_forward)),
                  ),
                ),
              ),
            ],
          )
        : paymentState == PaymentState.noAddress
            ? CustomPage(
                svgImage: AppImagesAssets.noAddressImage,
                title: 'You need a billing address',
                subtitle:
                    'You currently have no saved address.Without one, you won\'t able to add a new payment method.',
                buttonText: 'Add new address',
                isSpaced: true,
                onPressed: () => Get.offNamed(AppRoutes.addressPageRoute))
            : SizedBox();
  }
}
