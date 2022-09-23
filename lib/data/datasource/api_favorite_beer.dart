// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:beer_card_project/data/datasource/app_dependencies.dart';
import 'package:beer_card_project/domain/beer.dart';

class ApiFavoriteBeer {
  final String ids;
  final url = 'https://api.punkapi.com/v2/beers';

  ApiFavoriteBeer(this.ids);

  Future<List<dynamic>> getHttp() async {
    final response = await Dio().get(url,
        options: Options(method: 'GET'), queryParameters: {'ids': ids});
    return response.data;
  }

  Future<List<Beer>> getResponse() async {
    final favoriteBeers = await getHttp();
    final favoriteBeer = favoriteBeers
        .map((dynamic e) => Beer.fromJson(e as Map<String, dynamic>))
        .toList();
    return favoriteBeer;
  }
}
