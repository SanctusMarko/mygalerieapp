// 8 ProfileScreen ist einfacher. Wir haben ihn in einen separaten folder gelegt,
// 8 um die Übersichtlichkeit zu verbessern. Ein einfacher StatelessWidget,
// 8 der nur Text und ein NetworkImage enthält.
// 8 galery_screen.dart

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/685469924/photo/grumpy-pug-with-a-very-sad-face.jpg?s=612x612&w=0&k=20&c=Hg3TFNv38RK6mnRUea2W7Ax8nXhZaMx2hurJSn0YNtE='),
            ),
            const SizedBox(height: 20),
            const Text(
              'Kaya Müller',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
            Text('Fotograf',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.justify),
            const SizedBox(height: 20),
            Text(
              'Kaya Müller ist ein talentierter Fotograf und Künstler, dessen Arbeiten tiefe menschliche Emotionen und die Schönheit der Natur erforschen. Geboren in einer kleinen Stadt, wuchs Kaya umgeben von atemberaubenden Landschaften auf, die seinen künstlerischen Ausdruck maßgeblich beeinflussten. \n\nSeine Fotografien zeigen oft subtile Nuancen von Licht und Schatten und schaffen eine magische Atmosphäre, die die Betrachter in ihren Bann zieht. Müller verwendet analoge Kameras, um die Authentizität des Moments festzuhalten, da er glaubt, dass jedes Foto ein einzigartiges Kunstwerk ist. Seine Werke wurden auf zahlreichen internationalen Ausstellungen gezeigt und haben Anerkennung und Preise gewonnen. \n\nNeben der Fotografie beschäftigt sich Kaya auch mit Malerei und kombiniert diese beiden Kunstformen zu einzigartigen Collagen. Inspiration schöpft er aus dem Alltag, der Natur und inneren Gefühlen, wodurch er Werke schafft, die zugleich intim und universell sind. Seine Kunst spricht von der Vergänglichkeit der Zeit, der Schönheit des Augenblicks und der Verbundenheit aller Lebewesen. Kaya Müller beeindruckt und inspiriert weiterhin mit seiner Kreativität und Hingabe zur Kunst.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
