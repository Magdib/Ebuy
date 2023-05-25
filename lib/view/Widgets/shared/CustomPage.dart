import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'CustomButton.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.svgImage,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
    this.isSpaced,
  });
  final String svgImage;
  final String title;
  final String subtitle;
  final String buttonText;
  final void Function() onPressed;
  final bool? isSpaced;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Column(
            children: [
              SvgPicture.asset(svgImage),
              isSpaced != null
                  ? const SizedBox(
                      height: 30,
                    )
                  : const SizedBox(),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 14),
              ),
            ],
          ),
          CustomButton(text: buttonText, onPressed: onPressed)
        ],
      ),
    );
  }
}
