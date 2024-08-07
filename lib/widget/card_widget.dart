import 'package:app_manda_fresh/constant/colors.dart';
import 'package:flutter/material.dart';


class CardWidget extends StatelessWidget {
  final String name;
  final int temperature;
  const CardWidget({super.key, required this.name, required this.temperature});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
        color: greenColor, // Couleur de la bordure
        width: 1.0, // Épaisseur de la bordure
        ),
       borderRadius: BorderRadius.circular(10.0), // Rayons des coins de la bordure
      ),
      child: SizedBox(
<<<<<<< HEAD
              width: 170,
              height: 170,
=======
              width: 210,
              height: 200,
>>>>>>> 60f0577ad8062cc9cbaf293e5bb059a7c13557cd
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(name,  style: TextStyle(
                    color: blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Text(temperature.toString() + " °C", style: TextStyle(
                    color: blackColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                    ),),
                    Icon(Icons.thermostat, size: 30, color: greenColor,),
                    ],
                  )
      
                ],
              ),
          )
    );
  }
}
