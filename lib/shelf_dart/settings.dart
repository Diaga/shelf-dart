import 'package:shelf/shelf.dart' as shelf;

import 'package:shelf_dart/shelf_dart/middlewares.dart';
import 'package:shelf_dart/app/urls.dart' as app;

var middlewares = <shelf.Middleware>[
  shelf.logRequests(),
  CorsMiddleware(),
];

// Add urls from all apps
var urls = [
  ...app.urls,
];
