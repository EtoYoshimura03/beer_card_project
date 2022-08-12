// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seriolized_beer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Beer _$BeerFromJson(Map<String, dynamic> json) => Beer(
      bier: json['bier'] as String?,
      herkunft: json['herkunft'] as String?,
      bewertungInt: json['bewertungInt'] as int?,
      votes: json['votes'] as int?,
    );

Map<String, dynamic> _$BeerToJson(Beer instance) => <String, dynamic>{
      'bier': instance.bier,
      'herkunft': instance.herkunft,
      'bewertungInt': instance.bewertungInt,
      'votes': instance.votes,
    };
