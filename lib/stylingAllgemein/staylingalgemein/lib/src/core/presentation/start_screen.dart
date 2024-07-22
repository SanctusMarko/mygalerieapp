import 'dart:ui';
import 'package:flutter/material.dart';
import 'main_screen.dart';

// Definicija klase NewStartScreen koja nasljeđuje StatelessWidget
class NewStartScreen extends StatelessWidget {
  const NewStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold pruža osnovni vizualni izgled za Material Design aplikacije
      body: Stack(
        // Stack omogućuje pozicioniranje elemenata jedan iznad drugog
        children: [
          // Positioned.fill postavlja sliku u pozadini tako da popuni cijeli ekran
          Positioned.fill(
            child: Image.asset(
              'assets/bg_startscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          // Positioned postavlja sliku na određeno mjesto na ekranu
          Positioned(
            top: 100,
            right: -123,
            child: Image.asset(
              'assets/chick_cupcakes_3D.png',
              width: 550,
              height: 550,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 400,
            child: Image.asset(
              'assets/T2.png',
              width: 390,
              height: 450,
              fit: BoxFit.contain,
            ),
          ),
          // Align centira widget na dno ekrana
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 100.0),
              // Poziv funkcije koja gradi zamagljenu karticu
              child: _buildBlurredCard(context),
            ),
          ),
        ],
      ),
    );
  }

  // Funkcija koja gradi zamagljenu karticu
  Widget _buildBlurredCard(BuildContext context) {
    return ClipRRect(
      // ClipRRect omogućava zaokruživanje rubova widgeta
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        // BackdropFilter primjenjuje zamagljenje na pozadinu
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            // Postavljanje boje pozadine i zaobljenih rubova
            color: const Color.fromRGBO(55, 61, 59, 0.5),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // Column omogućava vertikalno postavljanje widgeta
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tekst naslova
                const Text(
                  'Feeling Snackish Today?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Tekst opisa
                const Text(
                  "Explore Angi's most popular snack selection and get instantly happy.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Kontejner s gumbom za narudžbu
                Container(
                  decoration: BoxDecoration(
                    // Gradijent pozadine za gumb
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(208, 88, 182, 1),
                        Color.fromRGBO(233, 159, 167, 1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigacija na glavnu stranicu aplikacije
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // Tekst na gumbu
                    child: const Text(
                      'Order Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
