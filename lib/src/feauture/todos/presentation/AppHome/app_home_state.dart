// 3 Wir haben die Ordner AppHome, Gallery und Profile.
// 3 AppHome ist im Grunde die Hauptseite im Simulator.
// 3 Und darin haben wir die AppBar, die BottomNavigationBar und den Body.
// 3 Was im Body angezeigt wird, hängt davon ab, was wir unten in der BottomNavigationBar anklicken.

import 'package:flutter/material.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/AppHome/app_home.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/Profile/profile_screen.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/Galery/galery_screen.dart';

class AppHomeState extends State<AppHome> {
  int currentPageIndex = 0;
  // Screens ist eine Liste, die Widgets enthält. Je nachdem,
  // welcher Button angeklickt wird, wird das entsprechende Widget geöffnet.

  final List<Widget> screens = [
    const GaleryScreen(), // currentPageIndex = 0, wenn der Button Bilder angeklickt wird, dann wird diese Klasse (Widget) geöffnet.

    const ProfileScreen(), // currentPageIndex = 1, wenn der Button Über mich angeklickt wird, dann wird diese Seite geöffnet.
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyGallery",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(54, 57, 59, 1),
      ),
      bottomNavigationBar: NavigationBar(
        // 5 Wenn wir auf einen dieser Bottoms klicken,
        // 5 senden wir dieser Methode den Index, auf den wir geklickt haben.

        onDestinationSelected: (int index) {
          setState(() {
            // 6 Und dann setzt es diese Variable currentPageIndex auf den Index,
            // 6 auf den wir geklickt haben, z.B. Über mich oder Bilder.
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 155, 160, 163),
        selectedIndex: currentPageIndex,
        destinations: const [
          // 4 Hier sind die icon und Buttons definiert.
          //Wir haben Bilder und Über mich.
          NavigationDestination(icon: Icon(Icons.newspaper), label: 'Bilder'),

          // 4 Hier sind die icon und Buttons definiert.
          //Wir haben Bilder und Über mich.
          NavigationDestination(icon: Icon(Icons.person), label: 'Über mich'),
        ],
      ),
      body: Center(
        // 7 Und basierend auf dieser Variablen wählen wir aus,
        // 7 welcher Screen geöffnet wird.
        // 7 Wenn wir currentPageIndex auf 0 setzen,
        // 7 wird die Klasse GalleryScreen Widget geöffnet,
        // 7 egal welchen Button wir anklicken.
        // 7 Oder wenn wir es auf 1 setzen, wird die Seite ProfileScreen geöffnet, egal wo wir klicken.
        // 7 profile_screen.dart

        child: screens[currentPageIndex],
      ),
    );
  }
}
