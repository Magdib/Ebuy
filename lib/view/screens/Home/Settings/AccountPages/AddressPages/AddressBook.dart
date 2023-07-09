import 'package:ebuy/Controller/Home/SettingsControllers/AddressController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/Home/Settings/AddressWidgets/AddressDataRow.dart';
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
        appBar: customAppBar('Address book'.tr, context, 4),
        body: GetBuilder<AddressControllerimp>(
            builder: (controller) => HandlingDataRequest(
                  onPressed: () => controller.getAddresses(true),
                  statusRequest: controller.statusRequest,
                  widget: controller.anyAddress == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      controller.shippingAddresList.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 20,
                                  ),
                                  itemBuilder: (context, index) => Dismissible(
                                    key: UniqueKey(),
                                    onDismissed: (direction) =>
                                        controller.removeAddress(index),
                                    child: CustomContainer(
                                      radius: 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomRadio(
                                                      condition: controller
                                                          .shippingAddresList[
                                                              index]
                                                          .isSelected,
                                                      radius: 25,
                                                      onTap: () => controller
                                                          .chooseAddress(index),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      controller
                                                          .shippingAddresList[
                                                              index]
                                                          .title,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                    onPressed: () => controller
                                                        .goToEditAddress(index),
                                                    icon: const Icon(
                                                      Icons.edit,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            color: AppColors.brandsGrey,
                                            thickness: 1,
                                          ),
                                          GetBuilder<AddressControllerimp>(
                                            builder: (controller) => Column(
                                              children: [
                                                AddressDataRow(
                                                    icon: Icons.person,
                                                    title: controller.authBox
                                                        .get(
                                                            HiveKeys.username)),
                                                AddressDataRow(
                                                    icon: Icons
                                                        .location_on_outlined,
                                                    title: controller
                                                        .addressList[index]
                                                        .addressStreet!),
                                                AddressDataRow(
                                                    icon: Icons
                                                        .amp_stories_rounded,
                                                    title: controller
                                                        .addressList[index]
                                                        .addressPhone!),
                                              ],
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
                              ),
                              CustomButton(
                                  text: 'Add Address'.tr,
                                  onPressed: () => Get.toNamed(
                                      AppRoutes.addAddressMapPageRoute))
                            ],
                          ),
                        )
                      : CustomPage(
                          svgImage: AppImagesAssets.noAddressImage,
                          title: 'No address'.tr,
                          subtitle:
                              'you don\'t have any address yet add one by clicking the button down below to add one from the map'
                                  .tr,
                          buttonText: 'Add address'.tr,
                          isSpaced: true,
                          onPressed: () =>
                              Get.toNamed(AppRoutes.addAddressMapPageRoute)),
                )));
  }
}
