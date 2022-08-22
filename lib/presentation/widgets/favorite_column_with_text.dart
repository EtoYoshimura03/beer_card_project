import 'package:beer_card_project/presentation/app_color.dart';
import 'package:beer_card_project/presentation/app_text.dart';
import 'package:flutter/material.dart';

class FavoriteColumnWithText extends StatelessWidget {
  const FavoriteColumnWithText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TextForBeer(
            text: 'Дата производства', fontSize: 14, color: AppColor.textColor),
        TextForBeer(
          text: 'Cлоган',
          fontSize: 14,
          color: AppColor.textColor,
        ),
        TextForBeer(text: 'ID', fontSize: 14, color: AppColor.textColor)
      ],
    );
  }
}
