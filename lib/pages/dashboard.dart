import 'package:app_manda_fresh/constant/colors.dart';
import 'package:app_manda_fresh/pages/produits.dart';
import 'package:app_manda_fresh/services/service_mqtt.dart';
import 'package:app_manda_fresh/widget/card_cellule_widget.dart';
import 'package:app_manda_fresh/widget/card_widget.dart';
import 'package:app_manda_fresh/widget/text_field_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'package:mqtt_client/mqtt_client.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static const TextStyle optionStyle=  TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  
  final MQTTService _mqttService = MQTTService();
  String _temperature = '0';
  final String commandTopic = 'manda/commande';   

  @override
  void initState() {
    super.initState();
    _connectToMQTT();
  }

  Future<void> _connectToMQTT() async {
    await _mqttService.connect();
    _mqttService.subscribeToTemperatureTopic();
    _mqttService.client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      if (c != null && c.isNotEmpty) {
        final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
        final String receivedMessage = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        setState(() {
          _temperature = receivedMessage;
        });
      }
    });
  }

  @override
  void dispose() {
    _mqttService.disconnect();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      leading: TextFielSearch(),
      leadingWidth: double.infinity,
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          const Text(
            "Vu d'ensemble des compartiments",
            style: optionStyle,
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardWidget(temperature: _temperature, name: "Refroidissement",),
              const SizedBox(width: 10,),
              const CardWidget(temperature: '50', name: "Séchage",),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Status des produits",
                style: optionStyle,
              ),
              IconButton(
                onPressed: () {
                  Get.to(PageProduits());
                }, 
                icon: Icon(
                  Icons.arrow_right,
                  color: greenColor,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          SnapCarousel(),
          const SizedBox(height: 20,),
          const Text(
            "Controle des cellules",
            style: optionStyle,
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _mqttService.sendCommand('servo1_ON', commandTopic);
                },
                child:  Text('Cellule 1', style:  TextStyle(
                  color: Colors.white, fontSize: 18, fontStyle: FontStyle.normal),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  //side: BorderSide(color: Colors.yellow, width: 5),
                  textStyle: const TextStyle(
                  color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
               ),
              ),
              ElevatedButton(
                onPressed: () {
                  _mqttService.sendCommand('servo2_ON', commandTopic);
                },
                child:  Text('Cellule 2', style:  TextStyle(
                  color: Colors.white, fontSize: 18, fontStyle: FontStyle.normal),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  //side: BorderSide(color: Colors.yellow, width: 5),
                  textStyle: const TextStyle(
                  color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
               ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               ElevatedButton(
                onPressed: () {
                  _mqttService.sendCommand('servo3_ON', commandTopic);
                },
                child:  Text('Cellule 3', style:  TextStyle(
                  color: Colors.white, fontSize: 18, fontStyle: FontStyle.normal),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  //side: BorderSide(color: Colors.yellow, width: 5),
                  textStyle: const TextStyle(
                  color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
               ),
              ),
              
               
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               ElevatedButton(
                onPressed: () {
                  _mqttService.sendCommand('ON', commandTopic);
                },
                child:  Text('Allumé', style:  TextStyle(
                  color: Colors.white, fontSize: 18, fontStyle: FontStyle.normal),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  //side: BorderSide(color: Colors.yellow, width: 5),
                  textStyle: const TextStyle(
                  color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
               ),
              ),
               ElevatedButton(
                onPressed: () {
                  _mqttService.sendCommand('OFF', commandTopic);
                },
                child:  Text('Eteint', style:  TextStyle(
                  color: Colors.white, fontSize: 18, fontStyle: FontStyle.normal),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  //side: BorderSide(color: Colors.yellow, width: 5),
                  textStyle: const TextStyle(
                  color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
               ),
              ),
              
               
            ],
          ),
        ],
      ),
    ),
  );
}

}

