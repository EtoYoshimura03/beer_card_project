import 'package:beer_card_project/data/datasource/api_favorite_beer.dart';
import 'package:beer_card_project/domain/serialized_favorite_beer.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteBeerModel extends ChangeNotifier {
  var _favoriteBeers = <FavoriteBeer>[];
  List<FavoriteBeer> get favoriteBeers => _favoriteBeers.toList();

  Future<void> getFavoriteBeer() async {
    final box = await Hive.openBox<dynamic>('favorite');
    print(box.values);
    final String ids = box.values.join('|');
    // Когда берёшь по айди, у этой апишки можно передать сразу несколько, разделив | этим, хз правильно ли я тут сделал или нет
    final _apiClient = ApiFavoriteBeer(ids);
    final favoriteBeers = await _apiClient.getResponse();
    _favoriteBeers += favoriteBeers;
    notifyListeners();
  }
}

class FavoriteBeerModelProvider extends InheritedNotifier {
  final FavoriteBeerModel favoriteBeerModel;
  const FavoriteBeerModelProvider({
    Key? key,
    required this.favoriteBeerModel,
    required Widget child,
  }) : super(key: key, child: child, notifier: favoriteBeerModel);

  static FavoriteBeerModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FavoriteBeerModelProvider>();
  }

  static FavoriteBeerModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<FavoriteBeerModelProvider>()
        ?.widget;
    return widget is FavoriteBeerModelProvider ? widget : null;
  }
}
