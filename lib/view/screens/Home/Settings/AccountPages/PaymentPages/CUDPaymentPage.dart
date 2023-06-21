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
      body: WillPopScope(
        onWillPop: () => controller.resetPayment(),
        child: GetBuilder<PaymentControllerimp>(
          builder: (controller) => HandlingDataRequest(
            onPressed: () => controller.savePayment(),
            statusRequest: controller.cudStatusRequest,
            widget: ListView(
              padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
              children: [
                TitledTextField(
                  label: 'Card number',
                  hint: 'Enter card number',
                  obscure: false,
                  keyboardType: TextInputType.number,
                  onChanged: (val) => controller.handleSavePayment(),
                  textEditingController: controller.cardNumberController,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Expiry date',
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
                            : 'MM / YY',
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
                  label: 'Name on card',
                  hint: 'Enter name on card',
                  obscure: false,
                  onChanged: (val) => controller.handleSavePayment(),
                  textEditingController: controller.cardNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<PaymentControllerimp>(
                  builder: (controller) => CustomConditionButton(
                      text: 'Save card',
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
