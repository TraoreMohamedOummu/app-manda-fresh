import 'package:app_manda_fresh/constant/colors.dart';
import 'package:app_manda_fresh/pages/login.dart';
import 'package:app_manda_fresh/pages/produits.dart';
import 'package:app_manda_fresh/widget/card_cellule_widget.dart';
import 'package:app_manda_fresh/widget/card_widget.dart';
import 'package:app_manda_fresh/widget/text_field_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static const TextStyle optionStyle=  TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  
  Widget  build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: TextFielSearch(),
        leadingWidth: double.infinity,
      ),
      body: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
          const  SizedBox(height: 20,),
           const   Text(
              "Vu d'ensemble des compartiments",
              style: optionStyle
            ),
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardWidget(temperature: 30, name: "Refroidissment",),
                SizedBox(height: 10,),
                CardWidget(temperature: 50, name: "Sechage",),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Status de produits",
                  style: optionStyle
                ),
                IconButton(
                  onPressed: (){
                    Get.to(PageProduits());
                  }, 
                  icon: Icon(
                    Icons.arrow_right,
                    color: greenColor,
                    size: 30,
                  )
                )
              ],
            ),
            const SizedBox(height: 10,),
            SnapCarousel()
           ],
        ),
    );
  }
}