import 'package:beer_card_project/presentation/app_color.dart';
import 'package:beer_card_project/presentation/app_text.dart';
import 'package:flutter/material.dart';

class ColumnWithText extends StatelessWidget {
  const ColumnWithText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TextForBeer(
            text: 'Происхождение', fontSize: 14, color: AppColor.textColor),
        TextForBeer(
          text: 'Оценка',
          fontSize: 14,
          color: AppColor.textColor,
        ),
        TextForBeer(text: 'Голоса', fontSize: 14, color: AppColor.textColor)
      ],
    );
  }
}
