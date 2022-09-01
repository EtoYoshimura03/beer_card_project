import 'package:beer_card_project/data/datasource/app_dependencies.dart';
import 'package:beer_card_project/domain/serialized_beer.dart';

import 'package:dio/dio.dart';

class ApiDatasource {
  final url = 'https://api.punkapi.com/v2/beers';
  final _ids = '1|2|3|4|5|6|7|8|9|10';

  Future<List<dynamic>> getHttp() async {
    final response = await AppDependencies().dio.get(url,
        options: Options(method: 'GET'), queryParameters: {'ids': _ids});
    return response.data;
  }

  Future<List<Beer>> getResponse() async {
    final beers = await getHttp();
    final beer = beers
        .map((dynamic e) => Beer.fromJson(e as Map<String, dynamic>))
        .toList();
    return beer;
  }
}
