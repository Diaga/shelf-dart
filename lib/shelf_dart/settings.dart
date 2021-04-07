import 'package:shelf/shelf.dart' as shelf;

import 'package:shelf_dart/shelf_dart/middlewares.dart';
import 'package:shelf_dart/app/urls.dart' as app;
import 'package:shelf_dart/api/urls.dart' as api;

// Directory to look for data
const dataPath = 'static/data/';

// Add middlewares to be registered in order
var middlewares = <shelf.Middleware>[
  shelf.logRequests(),
  CorsMiddleware(),
];

// Add urls from all apps
var urls = [...app.urls, ...api.urls];
