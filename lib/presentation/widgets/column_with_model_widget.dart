import 'package:beer_card_project/domain/beer_model.dart';
import 'package:beer_card_project/presentation/app_color.dart';
import 'package:beer_card_project/presentation/app_text.dart';
import 'package:flutter/material.dart';

class ColumnWithModel extends StatelessWidget {
  const ColumnWithModel({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final beer = BeerModelProvider.read(context)!.model.beers[index];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextForBeer(
            text: beer.firstBrewed.toString(),
            fontSize: 14,
            color: AppColor.textColor,
            maxLines: 1),
        SizedBox(
          width: 178,
          child: TextForBeer(
              text: beer.tagline.toString(),
              fontSize: 14,
              color: AppColor.textColor,
              maxLines: 2),
        ),
        TextForBeer(
          text: beer.id.toString(),
          fontSize: 14,
          color: AppColor.textColor,
          maxLines: 1,
        )
      ],
    );
  }
}
