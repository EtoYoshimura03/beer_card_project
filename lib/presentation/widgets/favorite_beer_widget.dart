import 'package:beer_card_project/domain/favorite_beer_model.dart';
import 'package:beer_card_project/presentation/app_color.dart';
import 'package:beer_card_project/presentation/app_text.dart';
import 'package:beer_card_project/presentation/widgets/favorite_column_with_model.dart';
import 'package:beer_card_project/presentation/widgets/favorite_column_with_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteBeerWidget extends StatefulWidget {
  const FavoriteBeerWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteBeerWidget> createState() => _FavoriteBeerWidgetState();
}

class _FavoriteBeerWidgetState extends State<FavoriteBeerWidget> {
  final favoriteBeerModel = FavoriteBeerModel();

  @override
  Widget build(BuildContext context) {
    return FavoriteBeerModelProvider(
        favoriteBeerModel: favoriteBeerModel, child: const _CardsWithData());
  }
}

class _CardsWithData extends StatefulWidget {
  const _CardsWithData({Key? key}) : super(key: key);

  @override
  State<_CardsWithData> createState() => _CardsWithDataState();
}

class _CardsWithDataState extends State<_CardsWithData> {
  @override
  Widget build(BuildContext context) {
    FavoriteBeerModelProvider.watch(context)
        ?.favoriteBeerModel
        .getFavoriteBeer();
    return ListView.builder(
        itemCount: FavoriteBeerModelProvider.watch(context)
                ?.favoriteBeerModel
                .favoriteBeers
                .length ??
            0,
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
                    child: _FavoriteBeerName(index: index),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 40, bottom: 5),
                        child: const FavoriteColumnWithText(),
                      ),
                      const SizedBox(width: 50),
                      Container(
                          padding: const EdgeInsets.only(top: 40, bottom: 5),
                          child: FavoriteColumnWithModel(index: index))
                    ],
                  ),
                ])),
          );
        });
  }
}

class _FavoriteBeerName extends StatelessWidget {
  final int index;
  const _FavoriteBeerName({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beer = FavoriteBeerModelProvider.read(context)!
        .favoriteBeerModel
        .favoriteBeers[index];
    return Text(
      beer.name.toString(),
      style: textStyle(18, AppColor.textColor),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}
