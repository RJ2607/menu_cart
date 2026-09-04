#!/bin/bash
# Quick local server for STAC JSON files
# Run with: cd stac && dart run server.dart
# Then the app will fetch STAC screens from localhost:8090

import 'dart:io';
import 'dart:convert';

void main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 8090);
  print('STAC server running at http://localhost:8090');

  await for (HttpRequest request in server) {
    final uri = request.uri.path;
    
    if (uri == '/' || uri == '/index.html') {
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType.html
        ..write('''
<!DOCTYPE html>
<html>
<head><title>STAC Server</title></head>
<body>
<h1>STAC Server Running</h1>
<p>Available screens:</p>
<ul>
<li><a href="/screens/menu.json">/screens/menu.json</a></li>
<li><a href="/screens/item_detail.json">/screens/item_detail.json</a></li>
<li><a href="/screens/item_detail_stateful.json">/screens/item_detail_stateful.json</a></li>
<li><a href="/screens/cart.json">/screens/cart.json</a></li>
</ul>
</body>
</html>
''');
      await request.response.close();
    } else if (uri.startsWith('/screens/')) {
      final filename = uri.replaceFirst('/screens/', '');
      final file = File('stac/.build/screens/$filename');
      
      if (await file.exists()) {
        final content = await file.readAsString();
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.json
          ..write(content);
      } else {
        request.response.statusCode = HttpStatus.notFound;
        request.response.write('{"error": "Screen not found"}');
      }
      await request.response.close();
    } else if (uri.startsWith('/themes/')) {
      final filename = uri.replaceFirst('/themes/', '');
      final file = File('stac/.build/themes/$filename');
      
      if (await file.exists()) {
        final content = await file.readAsString();
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.json
          ..write(content);
      } else {
        request.response.statusCode = HttpStatus.notFound;
      }
      await request.response.close();
    } else {
      request.response.statusCode = HttpStatus.notFound;
      await request.response.close();
    }
  }
}
