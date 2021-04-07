import 'package:shelf_dart/app/views.dart' as views;

import 'package:shelf_dart/shelf_dart/settings.dart' as settings;

var urls = [
  {
    'method': 'GET',
    'path': '/',
    'handler': views.echoRequest,
  },
  {
    'method': 'GET',
    'path': '/${settings.staticPath}/<file|.*>',
    'handler': views.serveStaticFile()
  },
];
