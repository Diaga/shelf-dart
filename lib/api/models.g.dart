// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    id: json['id'] as int,
    name: json['name'] as String,
    steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
    imageURL: json['imageURL'] as String,
    originalURL: json['originalURL'] as String,
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'steps': instance.steps,
      'imageURL': instance.imageURL,
      'originalURL': instance.originalURL,
    };
