import 'package:ebuy/Controller/Home/SettingsControllers/AddressController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:ebuy/view/Widgets/shared/CustomPage.dart';
import 'package:ebuy/view/Widgets/shared/CustomRadio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressBook extends StatelessWidget {
  const AddressBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('Address Book', context, 4),
        body: GetBuilder<AddressControllerimp>(
            builder: (controller) => controller.anyAddress == true
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.addressCardList.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 20,
                            ),
                            itemBuilder: (context, index) => CustomContainer(
                              radius: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        CustomRadio(
                                          condition: controller
                                              .addressCardList[index]
                                              .isSelected,
                                          radius: 25,
                                          onTap: () =>
                                              controller.chooseAddress(index),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          controller
                                              .addressCardList[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: AppColors.brandsGrey,
                                    thickness: 1,
                                  ),
                                  GetBuilder<AddressControllerimp>(
                                    builder: (controller) => ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      itemCount: controller.addressList.length,
                                      itemBuilder: (context, index) => Row(
                                        children: [
                                          Icon(
                                            controller.addressList[index].icon,
                                            color: AppColors.grey,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          FittedBox(
                                            child: SizedBox(
                                              width: UINumber.deviceWidth / 1.5,
                                              child: Text(
                                                controller
                                                    .addressList[index].title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(fontSize: 14),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomButton(
                            text: 'Add Address',
                            onPressed: () =>
                                Get.toNamed(AppRoutes.addAddressMapPageRoute))
                      ],
                    ),
                  )
                : CustomPage(
                    svgImage: AppImagesAssets.noAddressImage,
                    title: 'No address',
                    subtitle:
                        'you don\'t have any address yet add one by clicking the button down below to add one from the map',
                    buttonText: 'Add address',
                    isSpaced: true,
                    onPressed: () =>
                        Get.toNamed(AppRoutes.addAddressMapPageRoute))));
  }
}
