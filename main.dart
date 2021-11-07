/* Main.dart (Server) */

import 'dart:async';
import 'dart:io';

Future main() async {
  HttpServer server;
  try {
    server = await HttpServer.bind ( // Bind server to [IPAddress] and [Port].
      '127.0.0.1',  // IP Address, this can be anything, currently localhost for testing purposes.
      8080, // Port Address, this can be anything, currently localhost port for testing purposes.
      );
  } 
  // Error Handling.
  catch (e) {
    print ('failed to start server $e');
    exit (-1); // Close program.
  }
}
