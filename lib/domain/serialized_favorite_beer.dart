// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'serialized_favorite_beer.g.dart';

@JsonSerializable()
class FavoriteBeer {
  int? id;
  String? name;
  String? tagline;
  String? first_brewed;
  FavoriteBeer({
    required this.id,
    required this.name,
    required this.tagline,
    required this.first_brewed,
  });

  factory FavoriteBeer.fromJson(Map<String, dynamic> json) =>
      _$BeerFromJson(json);
  Map<String, dynamic> toJson() => _$BeerToJson(this);
}
