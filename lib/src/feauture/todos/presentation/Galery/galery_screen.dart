// 9 GalleryScreen ist etwas komplexer.
// 9 Er hat ein GridView mit 2 Spalten mit GalleryScreenItem.
// 9 galery_screen_item.dart

import 'package:flutter/material.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/Galery/galery_screen_item.dart';
import 'package:mygalerieapp/src/feauture/todos/data/item_list.dart';

class GaleryScreen extends StatelessWidget {
  const GaleryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final galeryItem = items[index];
          return GaleryScreenItem(
            title: galeryItem.title,
            url: galeryItem.url,
            data: galeryItem.date,
            description: galeryItem.description,
          );
        },
      ),
    );
  }
}
