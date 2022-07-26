import 'package:beer_card_project/domain/seriolized_products.dart';
import 'package:dio/dio.dart';

class ApiService {
  final url = 'https://beer-live.p.rapidapi.com/top10beers';

  var headers = {
    'X-RapidAPI-Key': 'f3bfe27a74msh27a11e5504be9eep11f293jsn08ebc1c7159b',
    'X-RapidAPI-Host': 'beer-live.p.rapidapi.com'
  };

  Future<List<dynamic>> getHttp() async {
    final response =
        await Dio().get(url, options: Options(method: 'GET', headers: headers));
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
