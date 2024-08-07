import 'package:app_manda_fresh/pages/dashboard.dart';
import 'package:app_manda_fresh/pages/produits.dart';
import 'package:app_manda_fresh/widget/text_field_search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage > {
  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions =  <Widget>[
    DashboardPage(),
    Text(
      'Search Page',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    PageProduits(),
    Text(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const TextFielSearch(),
                _widgetOptions.elementAt(_selectedIndex),
              ],
            ),
          )
        )
        ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Produit',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            label: 'Compartiment',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
            label: 'Produit',
          ),
          BottomNavigationBarItem(
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
