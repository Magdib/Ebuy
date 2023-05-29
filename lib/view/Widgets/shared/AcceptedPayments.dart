import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:flutter/material.dart';

import 'CustomContainer.dart';

class AcceptedPayments extends StatelessWidget {
  const AcceptedPayments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'We accept',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CustomContainer(
                  height: 40,
                  width: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(
                    payMethods[index],
                  )),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
              itemCount: payMethods.length),
        ),
      ],
    );
  }
}
