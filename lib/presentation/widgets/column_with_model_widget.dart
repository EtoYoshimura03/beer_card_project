import 'package:beer_card_project/domain/beer_model.dart';
import 'package:beer_card_project/presentation/app_color.dart';
import 'package:beer_card_project/presentation/app_text.dart';
import 'package:flutter/material.dart';

class ColumnWithModel extends StatelessWidget {
  final int index;
  const ColumnWithModel({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beer = BeerModelProvider.read(context)!.model.beers[index];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextForBeer(
            text: beer.herkunft.toString(),
            fontSize: 12,
            color: AppColor.textColor),
        TextForBeer(
            text: beer.bewertungInt.toString(),
            fontSize: 12,
            color: AppColor.textColor),
        TextForBeer(
            text: beer.votes.toString(),
            fontSize: 12,
            color: AppColor.textColor)
      ],
    );
  }
}
