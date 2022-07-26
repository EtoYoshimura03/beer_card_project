import 'package:beer_card_project/presentation/app_color.dart';
import 'package:beer_card_project/presentation/app_text.dart';
import 'package:flutter/material.dart';

class BeerDatailsWidget extends StatelessWidget {
  const BeerDatailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: TextForBeer(
            text: 'ВСТАВИТЬ ТЕКСТ',
            fontSize: 20,
            color: AppColor.textColor,
          ),
        ));
  }
}
