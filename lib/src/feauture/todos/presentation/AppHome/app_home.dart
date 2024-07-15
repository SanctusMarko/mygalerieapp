import 'package:flutter/material.dart';
import 'package:mygalerieapp/src/feauture/todos/presentation/AppHome/app_home_state.dart';

class AppHome extends StatefulWidget {
  // 2 Das ist ein StatefulWidget
  // 2 Es hätte auch ein StatelessWidget sein können, aber wegen der zukünftigen Entwicklung wurde ein StatefulWidget verwendet.
  //2 AppHome erbt von StatefulWidget und definiert den State für unser Widget.
  const AppHome({super.key});
  @override
  State<AppHome> createState() => AppHomeState();
  // 2 Hier definieren wir, dass der State unseres Widgets eine Instanz der Klasse _AppHomeState ist.-app_Home_State.dart
  // 2 Wir haben ihn in presentation/app_home_state platziert.
}
