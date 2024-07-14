import 'package:flutter/material.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/AppHome/app_home_state.dart';

class AppHome extends StatefulWidget {
  // moglo je biti i Staeteless widget ali zbog iduceg razvoja je postaljjen Statefull
  //App home nasljedjuje StatefulWidget i definira state za nas Widget
  const AppHome({super.key});
  @override
  State<AppHome> createState() => AppHomeState();
  // ovdije definieramo da je state naseg widgeta instanca klasse _AppHomeState
}
