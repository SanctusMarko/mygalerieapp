// 11 Zuerst sehen wir, dass in der AppBar "Details" steht
// 11 und dann im Body über Argumente die URL, die den Link zu diesem Bild darstellt,
// 11 den Titel, der diesen Titel darstellt,
// 11 eine SizedBox, die einen Abstand schafft,
// 11 das Datum, das dieses Datum ist,
// 11 und das Argument Description, das eigentlich die Beschreibung von allem ist.
// 11 Diese Argumente, die Description übernimmt,
// 11 erhalten wir aus diesem Data-Ordner und der Item-Liste.

import 'package:flutter/material.dart';

class GaleryDetailScreen extends StatelessWidget {
  const GaleryDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(
            54, 57, 59, 1), // Background color deteils screen
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              arguments['url'],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(
                  16.0), // Verschiebung der Textkanten auf beiden Seiten (zur besseren Übersichtlichkeit)

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // Definition des Titels

                    arguments['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    arguments['date'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 300,
                    child: Text(
                      arguments['description'], // Agument
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
