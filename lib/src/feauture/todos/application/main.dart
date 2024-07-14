import 'package:flutter/material.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/AppHome/app_home.dart';
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
      home: const AppHome(), // Glavna stranica sa svim slikama
      routes: {
        '/details': (context) =>
            const GaleryDetailScreen(), // Sranica sa detaljima za pojedinacnu sliku
      },
    );
  }
}
