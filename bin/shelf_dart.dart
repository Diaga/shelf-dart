import 'package:shelf/shelf_io.dart' as io;

import 'package:shelf_dart/shelf_dart/bootstrap.dart';
import 'package:shelf_dart/shelf_dart/settings.dart' as settings;

void main(List<String> args) async {
  var handler = App().handler;

  var server = await io.serve(handler, settings.hostname, settings.port);
  print('Serving at http://${server.address.host}:${server.port}');
}
