import 'package:beer_card_project/data/datasource/datasource.dart';
import 'package:beer_card_project/domain/seriolized_products.dart';
import 'package:flutter/material.dart';

class BeerModel extends ChangeNotifier {
  final apiClient = ApiService();
  var _beers = <Beer>[];
  List<Beer> get beers => _beers;

  Future<void> getBeer() async {
    final beers = await apiClient.getResponse();
    _beers += beers;
    notifyListeners();
  }
}

class BeerModelProvider extends InheritedNotifier {
  final BeerModel model;
  const BeerModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child, notifier: model);

  static BeerModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BeerModelProvider>();
  }

  static BeerModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<BeerModelProvider>()
        ?.widget;
    return widget is BeerModelProvider ? widget : null;
  }
}