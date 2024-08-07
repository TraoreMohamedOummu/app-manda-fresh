import 'package:app_manda_fresh/constant/colors.dart';
import 'package:app_manda_fresh/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App MandaFresh',
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        bottomNavigationBarTheme:   BottomNavigationBarThemeData(
          selectedItemColor: greenColor, // Couleur des icônes et labels sélectionnés
          unselectedItemColor: greyColor, // Couleur des icônes et labels non sélectionnés
          selectedLabelStyle: TextStyle(color: greenColor),
          unselectedLabelStyle: TextStyle(color: greyColor),
        ),
      ),
      home:  HomePage(),
    );
  }
}
