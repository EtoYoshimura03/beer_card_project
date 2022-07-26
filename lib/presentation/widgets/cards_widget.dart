import 'package:beer_card_project/domain/beer_model.dart';
import 'package:beer_card_project/presentation/app_color.dart';
import 'package:beer_card_project/presentation/images.dart';
import 'package:beer_card_project/presentation/app_text.dart';
import 'package:flutter/material.dart';

class CardsWidget extends StatefulWidget {
  const CardsWidget({Key? key}) : super(key: key);

  @override
  State<CardsWidget> createState() => _CardsWidgetState();
}

class _CardsWidgetState extends State<CardsWidget> {
  final model = BeerModel();

  @override
  Widget build(BuildContext context) {
    return BeerModelProvider(model: model, child: const _CardsWithData());
  }
}

class _CardsWithData extends StatefulWidget {
  const _CardsWithData({Key? key}) : super(key: key);

  @override
  State<_CardsWithData> createState() => _CardsWithDataState();
}

class _CardsWithDataState extends State<_CardsWithData> {
  void _onCardTap() {
    /*Возвращаю пустую страницу, т.к в апишке ничего интересного для доп инфы нет
Так бы возвращал виджеты/инфу обращаясь по ID карты*/
    Navigator.of(context).pushNamed('cards_widget/beer_details_widget');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: BeerModelProvider.watch(context)?.model.beers.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 160,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2))
                    ]),
                clipBehavior: Clip.hardEdge,
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 157.8, right: 70),
                    child: _BeerName(index: index),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      Image(image: BeerImages.images[index]),
                      const SizedBox(width: 30),
                      Container(
                        padding: const EdgeInsets.only(top: 40, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextForBeer(
                                text: 'Происхождение',
                                fontSize: 14,
                                color: AppColor.textColor),
                            TextForBeer(
                              text: 'Оценка',
                              fontSize: 14,
                              color: AppColor.textColor,
                            ),
                            TextForBeer(
                                text: 'Голоса',
                                fontSize: 14,
                                color: AppColor.textColor)
                          ],
                        ),
                      ),
                      const SizedBox(width: 50),
                      Container(
                          padding: const EdgeInsets.only(top: 40, bottom: 5),
                          child: _ColumnWithModel(index: index))
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onCardTap()),
                  )
                ])),
          );
        });
  }
}

class _ColumnWithModel extends StatelessWidget {
  final int index;
  const _ColumnWithModel({Key? key, required this.index}) : super(key: key);

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

class _BeerName extends StatelessWidget {
  final int index;
  const _BeerName({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beer = BeerModelProvider.read(context)!.model.beers[index];
    return Text(
      beer.bier.toString(),
      style: textStyle(16, AppColor.textColor),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}
