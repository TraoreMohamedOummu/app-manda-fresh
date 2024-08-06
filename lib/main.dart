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
    return const MaterialApp(
      title: 'App MandaFresh',
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}
