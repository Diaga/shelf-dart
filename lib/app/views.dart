import 'dart:async';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_static/shelf_static.dart';

FutureOr<shelf.Response> echoRequest(shelf.Request request) {
  return shelf.Response.ok('Request for "${request.url}"');
}

shelf.Handler serveStaticFile() => createStaticHandler(
      '.',
      listDirectories: true,
    );
