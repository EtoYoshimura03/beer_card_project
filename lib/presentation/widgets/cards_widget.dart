import 'package:beer_card_project/domain/beer_model.dart';
import 'package:beer_card_project/presentation/app_color.dart';
import 'package:beer_card_project/presentation/images.dart';
import 'package:beer_card_project/presentation/app_text.dart';
import 'package:beer_card_project/presentation/widgets/column_with_model_widget.dart';
import 'package:beer_card_project/presentation/widgets/column_with_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
  void _addToFavorite(int id) async {
    var box = await Hive.openBox<dynamic>('id');
    if (box.values.any((element) => element == id)) {
    } else {
      box.add(id);
    }
    print(box.values);
  }

  @override
  Widget build(BuildContext context) {
    BeerModelProvider.watch(context)?.model.getBeer();
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
                      Container(
                        padding: const EdgeInsets.only(top: 40, bottom: 5),
                        child: const ColumnWithText(),
                      ),
                      const SizedBox(width: 50),
                      Container(
                          padding: const EdgeInsets.only(top: 40, bottom: 5),
                          child: ColumnWithModel(index: index))
                    ],
                  ),
                  Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _addToFavorite(index + 1),
                      ))
                ])),
          );
        });
  }
}

class _BeerName extends StatelessWidget {
  final int index;
  const _BeerName({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beer = BeerModelProvider.read(context)!.model.beers[index];
    return Text(
      beer.name.toString(),
      style: textStyle(16, AppColor.textColor),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}
