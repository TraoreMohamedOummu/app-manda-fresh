import 'package:app_manda_fresh/constant/colors.dart';
import 'package:flutter/material.dart';


// Widget Cellule
class CelluleProduitsWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final int index; // Ajout d'un index pour afficher le numéro
  const CelluleProduitsWidget({super.key, required this.imagePath, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: greenColor, // Couleur de la bordure
              width: 1.0, // Épaisseur de la bordure
            ),
            borderRadius: BorderRadius.circular(10.0), // Rayons des coins de la bordure
          ),
          child: SizedBox(
            width: 110,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(imagePath),
                ),
                Text(
                  name + " ...",
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                // color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: greenColor,
                  width: 1.0,
                ),
              ),
              child: Center(
                child: Text(
                  '$index',
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}