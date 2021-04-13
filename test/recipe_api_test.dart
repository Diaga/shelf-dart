import 'dart:io';
import 'dart:convert';

import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/shelf_io.dart' as io;

import 'package:shelf_dart/shelf_dart/bootstrap.dart';
import 'package:shelf_dart/shelf_dart/settings.dart' as settings;
import 'package:shelf_dart/api/models.dart';

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
  test('testing list all recipe route', () async {
    final response = await httpClient.get(
      uri.replace(
        path: 'api/recipe',
      ),
    );

    final jsonResponse = jsonDecode(response.body);

    expect(response.statusCode, 200);
    expect(
      response.headers[HttpHeaders.contentTypeHeader],
      'application/json; charset=utf-8',
    );

    expect(jsonResponse.length, isPositive);

    jsonResponse.forEach((element) {
      expect(element['id'], isNotNull);
      expect(element['name'], isNotNull);
      expect(element['originalURL'], isNotNull);
      expect(element['steps'], isNotNull);
      expect(element['imageURL'], isNotNull);

      final recipe = Recipe.fromJson(element);

      expect(recipe.id, element['id']);
      expect(recipe.name, element['name']);
      expect(recipe.originalURL, element['originalURL']);
      expect(recipe.steps, element['steps']);
      expect(recipe.imageURL, element['imageURL']);
    });
  });
  test('testing search a recipe which exists', () async {
    const name = 'Roast';

    final response = await httpClient.get(
      uri.replace(
        path: 'api/recipe',
        queryParameters: {'name': name},
      ),
    );
    final jsonResponse = jsonDecode(response.body);

    expect(response.statusCode, 200);
    expect(
      response.headers[HttpHeaders.contentTypeHeader],
      'application/json; charset=utf-8',
    );

    expect(jsonResponse['id'], isNotNull);
    expect(jsonResponse['name'], isNotNull);
    expect(jsonResponse['originalURL'], isNotNull);
    expect(jsonResponse['steps'], isNotNull);
    expect(jsonResponse['imageURL'], isNotNull);

    final recipe = Recipe.fromJson(jsonResponse);

    expect(recipe.id, jsonResponse['id']);
    expect(recipe.name, jsonResponse['name']);
    expect(recipe.originalURL, jsonResponse['originalURL']);
    expect(recipe.steps, jsonResponse['steps']);
    expect(recipe.imageURL, jsonResponse['imageURL']);
  });
  test('testing search a recipe which does not exist', () async {
    const name = 'dart';

    final response = await httpClient.get(
      uri.replace(
        path: 'api/recipe',
        queryParameters: {'name': name},
      ),
    );

    expect(response.statusCode, 404);
    expect(response.body, 'Not found');
  });
  test('testing getting recipe from primary key which exists', () async {
    const id = '1';

    final response = await httpClient.get(
      uri.replace(
        path: 'api/recipe/$id',
      ),
    );
    final jsonResponse = jsonDecode(response.body);

    expect(response.statusCode, 200);
    expect(
      response.headers[HttpHeaders.contentTypeHeader],
      'application/json; charset=utf-8',
    );

    expect(jsonResponse['id'], isNotNull);
    expect(jsonResponse['name'], isNotNull);
    expect(jsonResponse['originalURL'], isNotNull);
    expect(jsonResponse['steps'], isNotNull);
    expect(jsonResponse['imageURL'], isNotNull);

    final recipe = Recipe.fromJson(jsonResponse);

    expect(recipe.id, jsonResponse['id']);
    expect(recipe.name, jsonResponse['name']);
    expect(recipe.originalURL, jsonResponse['originalURL']);
    expect(recipe.steps, jsonResponse['steps']);
    expect(recipe.imageURL, jsonResponse['imageURL']);
  });
  test('testing getting recipe from primary key which does not exist',
      () async {
    const id = '99999999';

    final response = await httpClient.get(
      uri.replace(
        path: 'api/recipe/$id',
      ),
    );

    expect(response.statusCode, 404);
    expect(response.body, 'Not found');
  });
}
