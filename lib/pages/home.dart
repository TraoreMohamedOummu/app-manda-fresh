import 'package:app_manda_fresh/constant/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title:const Text(""),
      ),
      body:   Padding(
        padding: const  EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Recherche...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0), // Bordure arrondie
                      borderSide:  BorderSide(
                        color: greenColor, // Couleur de la bordure
                        width: 1.0, // Épaisseur de la bordure
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Bordure arrondie
                    borderSide:  BorderSide(
                      color: greenColor, // Couleur de la bordure quand le champ est focalisé
                      width: 2.0, // Épaisseur de la bordure
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Bordure arrondie
                  borderSide: BorderSide(
                    color: greyColor, // Couleur de la bordure quand le champ est désactivé
                    width: 1.0, // Épaisseur de la bordure
                  ),
              ),
                    contentPadding:  const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              ),
              const SizedBox(width: 16), // Espacement entre le champ de recherche et l'icône
              const IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: null,
              ),
              ],
            )
          ],
        ),
      ),
    );
  }
}