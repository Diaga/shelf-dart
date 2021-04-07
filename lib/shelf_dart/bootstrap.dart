import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_router/shelf_router.dart';

import 'package:shelf_dart/shelf_dart/settings.dart';

class App {
  shelf.Handler _handler;
  shelf.Handler get handler => _handler;

  App() {
    var pipeline = shelf.Pipeline();
    for (var middleware in middlewares) {
      pipeline.addMiddleware(middleware);
    }

    _handler = pipeline.addHandler(registerRoutes());
    ;
  }

  Router registerRoutes() {
    var router = Router();

    for (var url in urls) {
      router.add(url['method'], url['path'], url['handler']);
    }

    return router;
  }
}
