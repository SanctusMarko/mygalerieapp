// 10 Wir sehen, dass er einen Titel, eine URL, ein Datum und eine Beschreibung hat.
// 10 Alle Bilder, die wir mit diesen Beschriftungen sehen,
// 10 wo Bild und Text sind, befinden sich in gallery_screen.dart,
// 10 und gallery_item ist jedes einzelne, z.B. dies ist das erste, das zweite, das dritte.
// 10 Und wenn wir z.B. auf Bunter Basketball klicken,
// 10 dann haben wir classe gallery_details_screen.dart.

import 'package:flutter/material.dart';

class GaleryScreenItem extends StatelessWidget {
  const GaleryScreenItem({
    super.key,
    required this.title,
    required this.url,
    required this.data,
    required this.description,
  });
  final String title;
  final String url;
  final String data;
  final String description;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: {
            'title': title,
            'url': url,
            'date': data,
            'description': description,
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  url,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
