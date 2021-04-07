import 'package:shelf/shelf.dart';

Middleware CorsMiddleware() {
  const corsHeaders = {
    'Access-Control-Allow-Headers': 'Origin, Content-Type',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Origins': '*',
  };

  return createMiddleware(requestHandler: (Request request) {
    if (request.method.toUpperCase() == 'OPTIONS') {
      return Response.ok('', headers: corsHeaders);
    }
    return null;
  }, responseHandler: (Response response) {
    return response.change(headers: corsHeaders);
  });
}
