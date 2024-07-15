import 'package:flutter/material.dart';
import 'package:mygalerieapp/src/core/presentation/AppHome/app_home.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/Galery/galery_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home:
          const AppHome(), // 1 Wenn wir starten Er ruft die Klasse das AppHome auf, die Hauptseite mit allen Bildern
      routes: {
        '/details': (context) =>
            const GaleryDetailScreen(), // Seite mit Details zu einem einzelnen Bild
      },
    );
  }
}
