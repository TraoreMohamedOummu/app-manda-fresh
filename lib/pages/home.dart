import 'package:app_manda_fresh/pages/dashboard.dart';
<<<<<<< HEAD
import 'package:app_manda_fresh/pages/produits.dart';
=======
>>>>>>> 60f0577ad8062cc9cbaf293e5bb059a7c13557cd
import 'package:app_manda_fresh/widget/text_field_search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage > {
  int _selectedIndex = 0;

<<<<<<< HEAD
  static List<Widget> _widgetOptions = <Widget>[
    const DashboardPage(),
    PageProduits(),
    const Text(
      'Profile Page',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    const Text(
=======
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    Text(
      'Search Page',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile Page',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
>>>>>>> 60f0577ad8062cc9cbaf293e5bb059a7c13557cd
      'Settings Page',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
<<<<<<< HEAD
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const TextFielSearch(),
                _widgetOptions.elementAt(_selectedIndex),
              ],
            ),
=======
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const TextFielSearch(),
              _widgetOptions.elementAt(_selectedIndex),
            ],
>>>>>>> 60f0577ad8062cc9cbaf293e5bb059a7c13557cd
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
<<<<<<< HEAD
            icon: Icon(Icons.shopping_bag),
            label: 'Produit',
            
          ),
          BottomNavigationBarItem(
=======
>>>>>>> 60f0577ad8062cc9cbaf293e5bb059a7c13557cd
            icon: Icon(Icons.kitchen),
            label: 'Compartiment',
          ),
          BottomNavigationBarItem(
<<<<<<< HEAD
=======
            icon: Icon(Icons.shopping_bag),
            label: 'Produit',
          ),
          BottomNavigationBarItem(
>>>>>>> 60f0577ad8062cc9cbaf293e5bb059a7c13557cd
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        
        onTap: _onItemTapped,
      ),
    );
  }
}
