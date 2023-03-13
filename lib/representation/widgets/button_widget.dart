import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/constants/text_styles_constant.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const ButtonWidget({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMediumPadding),
        gradient: Gradients.defaultGradientBackground,
      ),
      child: Text(
        title,
        style: TextStyles.defaultStyle.bold.whiteTextColor,
      ),
    );
  }
}
