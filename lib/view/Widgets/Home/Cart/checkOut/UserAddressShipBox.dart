import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/model/CartModels/CartAddressModel.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressShipBox extends StatelessWidget {
  const UserAddressShipBox({
    super.key,
    required this.title,
    required this.userAddress,
  });
  final String title;
  final List<CartAddressModel> userAddress;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.primaryColor,
                    ))
              ],
            ),
          ),
          const Divider(
            color: AppColors.brandsGrey,
            thickness: 1,
          ),
          GetBuilder<CartControllerImp>(
            builder: (controller) => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: userAddress.length,
              itemBuilder: (context, index) => Row(
                children: [
                  Icon(
                    userAddress[index].icon,
                    color: AppColors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    userAddress[index].title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14),
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
    );
  }
}
