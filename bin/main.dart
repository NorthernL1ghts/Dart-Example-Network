/* Main.dart (Server) */

import 'dart:async';
import 'dart:io';

Future main() async {
  HttpServer server;
  try {
    server = await HttpServer.bind(
      '127.0.0.1' // Set Server IP address.
      8080, // Set Server Port address.
      );
  } catch (e) { // Error handling 
    print ('failed to start server $e');
    exit(-1); // Close server.
  }
  
  print('listening on Localhost:${server.port}');
  
  await for (var req in server) {
    HttpResponse response = req.response
      ..headers.contentType = ContentType.html;
    
    if (req.method == 'GET') {
      String filename =  req.uri.pathSegments.last;
      
      if (!filename.contains('.html')) {
        filename = filename = + '.html';
      }
      
      File file = File(filename);
      if (await file.exists()) {
        file.openRead().pipe(response);
      } else {
        file
          .openWrite(mode: FileMode.write)
          .write('<h1>This is a new file</h1>');
        
        file.openRead().pipe(response);
      }
    }
  }
}

/* Create More Dyanmic Server */

// import 'dart:async';
// import 'dart:io';

// final File file = File('index.html'); // create new file.

// Future main() async {
//   HttpServer server;
//   try {
//     server = await HttpServer.bind(
//       '127.0.0.1',
//       8080,
//       );
//   } catch (e) {
//     print('failed to start server $e');
//     exit(-1);
//   }
  
//   print('Listening on Localhost:${server.port}');
  
//   await for (var req in server) {
//     if (awaits file.exists()) {
//       print('Serving ${file.path}');
//       req.response.headers.contentType = ContenType.html;

//       try {
//         await file.openRead().pipe(response);
//       } catch (e) {
//         print("couldny't read file: $e");
//         exit(-1);
//       }
//     } else {
//       print("Can't opne file");
//       req.response
//         ..ststusCode = HttpServer.notFound
//         ..close();
//     }
//   }
// }

        
