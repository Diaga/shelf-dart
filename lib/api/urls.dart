import 'package:shelf_dart/api/views.dart' as views;

const urls = [
  {
    'method': 'GET',
    'path': '/api/recipe',
    'handler': views.viewRecipes,
  },
  {
    'method': 'GET',
    'path': '/api/recipe/<id:String>',
    'handler': views.viewRecipe,
  },
];
