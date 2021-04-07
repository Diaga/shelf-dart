import 'package:shelf/shelf_io.dart' as io;

import 'package:shelf_dart/shelf_dart/bootstrap.dart';

const hostname = 'localhost';
const port = 8080;

void main(List<String> args) async {
  var handler = App().handler;

  var server = await io.serve(handler, hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
