import 'package:app_manda_fresh/constant/colors.dart';
import 'package:app_manda_fresh/widget/numero_produit.dart';
import 'package:flutter/material.dart';

class  PageProduits extends StatefulWidget {
  @override
  _PageProduitsState createState() => _PageProduitsState();
}

class _PageProduitsState extends State<PageProduits> {
  bool _isExpanded = false;
  bool _isExpandedProduits = false;

  // Exemple de liste de produits
  final List<Map<String, String>> produits = List.generate(
    12,
    (index) =>
        {'imagePath': 'assets/images/ananas.png', 'name': 'Produit $index'},
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
             Text(
              'Compartiment froid',
              style: TextStyle(fontSize: 20, color: blackColor,
               fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: greyColor,),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ],
        ),
        AnimatedContainer(
          duration: const  Duration(milliseconds: 300),
          height: _isExpanded ? 400 : 0,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Température actuelle',
                      style: TextStyle(fontSize: 18, color: blackColor,
               fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.thermostat),
                        Text(
                          "3°C",
                          style: TextStyle(fontSize: 15, color: blackColor,
               fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      'Liste des produits',
                      style: TextStyle(fontSize: 18, color: blackColor,
               fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(_isExpandedProduits
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,color: greyColor,),
                      onPressed: () {
                        setState(() {
                          _isExpandedProduits = !_isExpandedProduits;
                        });
                      },
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: const  Duration(milliseconds: 100),
                  height: _isExpandedProduits ? 400 : 0,
                  child: GridView.builder(
                    
                    itemCount: produits.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 4, // Nombre de colonnes
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      final produit = produits[index];
                      return CelluleProduitsWidget(
                        index: index+1,
                        imagePath: produit['imagePath']!,
                        name: produit['name']!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
