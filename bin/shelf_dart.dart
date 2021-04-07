import 'package:shelf_dart/settings.dart' as settings;

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;


void main(List<String> args) async {

  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(_echoRequest);

  var server = await io.serve(handler, settings.hostname, settings.port);
  print('Serving at http://${server.address.host}:${server.port}');
}

shelf.Response _echoRequest(shelf.Request request) =>
    shelf.Response.ok('Requests for "${request.url}"');
