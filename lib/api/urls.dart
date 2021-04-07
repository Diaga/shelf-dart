import 'package:shelf_dart/api/views.dart' as views;

const urls = [
  {
    'method': 'GET',
    'path': '/recipe',
    'handler': views.viewRecipes,
  },
  {
    'method': 'GET',
    'path': '/recipe/<id:String>',
    'handler': views.viewRecipe,
  },
];
