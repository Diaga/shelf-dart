import 'dart:async';
import 'dart:io';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_static/shelf_static.dart';

FutureOr<shelf.Response> serveIndexHTML(shelf.Request request) {
  var html = File('lib/app/templates/index/index.html').readAsStringSync();
  return shelf.Response.ok(html, headers: {'Content-Type': 'text/html'});
}

shelf.Handler serveStaticFile() => createStaticHandler(
      '.',
      listDirectories: true,
    );
