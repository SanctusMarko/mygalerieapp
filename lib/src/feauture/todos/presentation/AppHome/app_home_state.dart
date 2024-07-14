import 'package:flutter/material.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/AppHome/app_home.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/Profile/profile_screen.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/Galery/galery_screen.dart';

class AppHomeState extends State<AppHome> {
  int currentPageIndex = 0;
  // screens je lista koja sadrzi widgete, ovisno o tome koji button se klikne tako se optvara pojedini widget
  final List<Widget> screens = [
    const GaleryScreen(), // currentPageIndex = 0 kad se klikne na tipku Bilder onda se otvara ova klassa (widget)
    const ProfileScreen(), // currentPageIndex =1 kad se klikne na tipku über mich onda se otvara ova stranica
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
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 155, 160, 163),
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.newspaper), label: 'Bilder'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Über mich'),
        ],
      ),
      body: Center(
        child: screens[currentPageIndex],
      ),
    );
  }
}
