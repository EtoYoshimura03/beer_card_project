// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serialized_favorite_beer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteBeer _$BeerFromJson(Map<String, dynamic> json) => FavoriteBeer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      tagline: json['tagline'] as String?,
      first_brewed: json['first_brewed'] as String?,
    );

Map<String, dynamic> _$BeerToJson(FavoriteBeer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tagline': instance.tagline,
      'first_brewed': instance.first_brewed,
    };
