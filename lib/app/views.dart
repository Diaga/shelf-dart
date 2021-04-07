import 'package:shelf/shelf.dart' as shelf;

shelf.Response echoRequest(shelf.Request request) {
  return shelf.Response.ok('Request for "${request.url}"');
}
