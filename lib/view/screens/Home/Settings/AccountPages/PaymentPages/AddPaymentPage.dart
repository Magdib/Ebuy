import 'package:ebuy/Controller/Home/SettingsControllers/PaymentController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/Ui%20Functions/CardExpiredDialog.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/shared/AcceptedPayments.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:ebuy/view/Widgets/shared/TitledTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaymentPage extends GetView<PaymentControllerimp> {
  const AddPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
        children: [
          TitledTextFiled(
              label: 'Card number',
              hint: 'Enter card number',
              obscure: false,
              keyboardType: TextInputType.number,
              textEditingController: controller.cardNumberController,
              validator: (val) {}),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Expiry date',
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () => cardExpiredDialog(context),
            minWidth: double.infinity,
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UINumber.borderRadius),
                side: const BorderSide(color: AppColors.grey, width: 1)),
            child: ListTile(
              title: GetBuilder<PaymentControllerimp>(
                builder: (controller) => Text(
                  controller.expryDate != null
                      ? '${controller.expryDate}'
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
          TitledTextFiled(
              label: 'Name on card',
              hint: 'Enter name on card',
              obscure: false,
              keyboardType: TextInputType.number,
              textEditingController: controller.cardNameController,
              validator: (val) {}),
          const SizedBox(
            height: 20,
          ),
          CustomButton(text: 'Save card', onPressed: () {}),
          const SizedBox(
            height: 15,
          ),
          const AcceptedPayments()
        ],
      ),
    );
  }
}
