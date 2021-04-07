import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_router/shelf_router.dart';

import 'package:shelf_dart/shelf_dart/settings.dart' as settings;

class App {
  late shelf.Handler _handler;

  shelf.Handler get handler => _handler;

  App() {
    var pipeline = shelf.Pipeline();
    for (var middleware in settings.middlewares) {
      pipeline.addMiddleware(middleware);
    }

    _handler = pipeline.addHandler(registerRoutes());
  }

  Router registerRoutes() {
    var router = Router();

    for (var url in settings.urls) {
      router.add(
        url['method'] as String,
        url['path'] as String,
        url['handler'] as Function,
      );
    }

    return router;
  }
}
