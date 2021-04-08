import 'dart:convert';
import 'dart:html';

import 'package:shelf_dart/api/models.dart';
import 'package:shelf_dart/shelf_dart/settings.dart' as settings;

void main() {
  final searchSection = querySelector('#search-section')!;
  final searchBar = querySelector('#search-bar')! as InputElement;
  final searchButton = querySelector('#search-button')!;

  final recipeNotFound = querySelector('#recipe-not-found')!;
  final recipeCard = querySelector('#recipe-card')!;

  final recipeTitle = querySelector('#recipe-title')!;
  final recipeImage = querySelector('#recipe-img')! as ImageElement;
  final recipeDirections = querySelector('#recipe-directions')!;
  final recipeButton = querySelector('#recipe-button')! as AnchorElement;

  searchButton.onClick.listen((event) async {
    if (searchBar.value != null) {
      final response = await HttpRequest.getString(
        'http://${settings.hostname}:${settings.port}'
        '/recipe?name=${searchBar.value}',
      );

      final found = response != 'Not found';

      if (found) {
        final recipe = Recipe.fromJson(jsonDecode(response));

        recipeCard.style.display = 'block';
        recipeNotFound.style.display = 'none';

        recipeTitle.innerText = recipe.name;
        recipeImage.src = recipe.imageURL;

        recipeDirections.children = [];
        recipe.steps.forEach((step) {
          final li = Element.li()..innerText = step;
          recipeDirections.children.add(li);
        });
        recipeButton.href = recipe.originalURL;
      } else {
        recipeNotFound.style.display = 'block';
        recipeCard.style.display = 'none';
      }

      searchSection.style.height = '40%';
    }
  });
}
