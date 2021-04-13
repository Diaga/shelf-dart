import 'dart:io';

import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/shelf_io.dart' as io;

import 'package:shelf_dart/shelf_dart/bootstrap.dart';
import 'package:shelf_dart/shelf_dart/settings.dart' as settings;

void main() {
  late http.Client httpClient;
  late HttpServer httpServer;
  late Uri uri;
  setUp(() async {
    httpClient = http.Client();

    var handler = App().handler;
    httpServer = await io.serve(
      handler,
      settings.hostname,
      settings.port,
      shared: true,
    );

    uri = Uri.parse('http://${httpServer.address.host}:${httpServer.port}');
  });
  tearDown(() async {
    httpClient.close();
    await httpServer.close(force: true);
  });
  test('testing index page is available', () async {
    final response = await httpClient.get(uri);

    final indexHTML = File(
      '${Directory.current.path}/lib/app/templates/index/index.html',
    );

    expect(response.statusCode, 200);
    expect(response.body, indexHTML.readAsStringSync());
  });
}
