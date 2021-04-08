import 'dart:convert';
import 'dart:io';

import 'package:shelf_dart/api/models.dart';
import 'package:shelf_dart/shelf_dart/settings.dart' as settings;

abstract class Manager {
  List getAll();

  Object get(String id);
}

class RecipeManager extends Manager {
  final dataPath = '${settings.dataPath}recipes.json';
  late List _recipes;

  RecipeManager() {
    _recipes = jsonDecode(File(dataPath).readAsStringSync())
        .map((recipe) => Recipe.fromJson(recipe))
        .toList();
  }

  @override
  List getAll() {
    return _recipes;
  }

  @override
  Object get(String id) {
    return _recipes.firstWhere(
      (recipe) => recipe.id.toString() == id,
      orElse: () => 'Not found',
    );
  }

  Object findByName(String name) {
    return _recipes.firstWhere(
      (recipe) => recipe.name.toLowerCase().contains(
            name.toLowerCase(),
          ),
      orElse: () => 'Not found',
    );
  }
}
