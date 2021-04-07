import 'package:shelf_dart/api/managers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Recipe {
  int id;
  String name;
  List<String> steps;
  String imageURL;
  String originalURL;

  static Manager objects = RecipeManager();

  Recipe({
    required this.id,
    required this.name,
    required this.steps,
    required this.imageURL,
    required this.originalURL,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  @override
  String toString() => toJson().toString();
}
