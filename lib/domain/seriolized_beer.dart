import 'package:json_annotation/json_annotation.dart';
part 'seriolized_beer.g.dart';

@JsonSerializable()
class Beer {
  String? bier;
  String? herkunft;
  int? bewertungInt;
  int? votes;

  Beer(
      {required this.bier,
      required this.herkunft,
      required this.bewertungInt,
      required this.votes});

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);
  Map<String, dynamic> toJson() => _$BeerToJson(this);
}
