import 'dart:async';

import 'package:shelf_dart/api/managers.dart';
import 'package:shelf_dart/api/models.dart';
import 'package:shelf/shelf.dart' as shelf;

const _headers = {'Content-Type': 'application/json'};

FutureOr<shelf.Response> viewRecipes(shelf.Request request) {
  final params = request.url.queryParameters;
  if (params.containsKey('name')) {
    return shelf.Response.ok(
      (Recipe.objects as RecipeManager).findByName(params['name']!).toString(),
      headers: _headers,
    );
  }
  return shelf.Response.ok(
    Recipe.objects.getAll().toString(),
    headers: _headers,
  );
}

FutureOr<shelf.Response> viewRecipe(shelf.Request request, String id) {
  return shelf.Response.ok(
    Recipe.objects.get(id).toString(),
    headers: _headers,
  );
}
