import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/Colors.dart';
import '../../../../data/model/authModels/AccountListTileModel.dart';
import '../HomePage/NewTrend/FilterPageWidgets/GreyDivider.dart';

class AccountPageCard extends StatelessWidget {
  const AccountPageCard({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<AccountListTileModel> list;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: UINumber.cardElevation,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Column(
          children: [
            SizedBox(
              height: 38,
              child: ListTile(
                dense: true,
                title: Text(
                  list[index].text,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                leading: Icon(
                  list[index].leadingIcon,
                  color: AppColors.primaryColor,
                ),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ),
            const GreyDivider(),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
