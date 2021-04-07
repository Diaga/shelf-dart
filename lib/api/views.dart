import 'package:shelf_dart/api/models.dart';
import 'package:shelf/shelf.dart' as shelf;

const _headers = {'Content-Type': 'application/json'};

shelf.Response viewRecipes(shelf.Request request) {
  return shelf.Response.ok(
    Recipe.objects.getAll().toString(),
    headers: _headers,
  );
}

shelf.Response viewRecipe(shelf.Request request, String id) {
  return shelf.Response.ok(
    Recipe.objects.get(id).toString(),
    headers: _headers,
  );
}
