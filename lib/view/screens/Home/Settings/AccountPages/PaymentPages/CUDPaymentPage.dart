import 'package:ebuy/Controller/Home/SettingsControllers/PaymentController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/UiFunctions/Dialogs/CardExpiredDialog.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/shared/AcceptedPayments.dart';
import 'package:ebuy/view/Widgets/shared/CustomConditionButton.dart';
import 'package:ebuy/view/Widgets/shared/TitledTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CUDPaymentPage extends GetView<PaymentControllerimp> {
  const CUDPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.editIndex != null
          ? AppBar(
              title: Text(
                "Edit Payment".tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              elevation: 0.0,
              actions: [
                IconButton(
                    onPressed: () => controller.deletePayment(),
                    icon: const Icon(Icons.delete))
              ],
            )
          : null,
      body: WillPopScope(
        onWillPop: () => controller.resetPayment(),
        child: GetBuilder<PaymentControllerimp>(
          builder: (controller) => HandlingDataRequest(
            onPressed: () => controller.savePayment(),
            statusRequest: controller.cudStatusRequest,
            widget: ListView(
              padding: EdgeInsets.only(
                  top: controller.editIndex == null ? 100 : 20,
                  left: 10,
                  right: 10),
              children: [
                TitledTextField(
                  label: 'Card number'.tr,
                  hint: 'Enter card number here...'.tr,
                  obscure: false,
                  keyboardType: TextInputType.number,
                  onChanged: (val) => controller.handleSavePayment(),
                  textEditingController: controller.cardNumberController,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Expiry date'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () => cardExpiredDialog(context),
                  minWidth: double.infinity,
                  padding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(UINumber.borderRadius),
                      side: const BorderSide(color: AppColors.grey, width: 1)),
                  child: ListTile(
                    title: GetBuilder<PaymentControllerimp>(
                      builder: (controller) => Text(
                        controller.expiryDate != null
                            ? '${controller.expiryDate}'
                            : 'MM / YY'.tr,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_downward_rounded,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                TitledTextField(
                  label: 'Name on card'.tr,
                  hint: 'Enter name on card here...'.tr,
                  obscure: false,
                  onChanged: (val) => controller.handleSavePayment(),
                  textEditingController: controller.cardNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<PaymentControllerimp>(
                  builder: (controller) => CustomConditionButton(
                      text: 'Save card'.tr,
                      condition: controller.canSaveCard,
                      onPressed: () => controller.savePayment()),
                ),
                const SizedBox(
                  height: 15,
                ),
                const AcceptedPayments()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
