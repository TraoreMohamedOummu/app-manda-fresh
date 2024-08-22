import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_server_client.dart' as mqtt;

class MQTTService {
  mqtt.MqttServerClient client;
  final String broker = 'c133a990.ala.dedicated.aws.emqxcloud.com'; // Adresse IP du broker local
  final int port = 1883; // Port par défaut
  final String topic = 'home/temperature'; // Sujet pour les données des capteurs
  final String username = 'traore-manda-fresh'; // Nom d'utilisateur MQTT
  final String password = 'Manda2024'; // Mot de passe MQTT

  MQTTService()
      : client = mqtt.MqttServerClient.withPort('c133a990.ala.dedicated.aws.emqxcloud.com', 'mqttClientId', 1883) {
    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
  }

  Future<void> connect() async {
    try {
      final mqtt.MqttConnectMessage connMessage = mqtt.MqttConnectMessage()
          .withClientIdentifier('mqttClientId')
          .withCredentials(username, password) // Authentification utilisateur/mot de passe
          .startClean()
          .withWillQos(mqtt.MqttQos.atLeastOnce);
      client.connectionMessage = connMessage;

      print('Tentative de connexion au broker...');
      await client.connect();

      if (client.connectionStatus!.state == mqtt.MqttConnectionState.connected) {
        print('Connecté au broker MQTT.');
        client.subscribe(topic, mqtt.MqttQos.atMostOnce);
        client.updates?.listen((List<mqtt.MqttReceivedMessage<mqtt.MqttMessage>> c) {
          final mqtt.MqttMessage recMess = c[0].payload;
          final payload =
              mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
          print('Message reçu : $payload');
        });
      } else {
        print('Échec de la connexion - Statut : ${client.connectionStatus}');
        disconnect();
      }
    } catch (e) {
      print('Erreur lors de la connexion : $e');
      disconnect();
    }
  }

  void envoyerCommande(String commande) {
    final builder = mqtt.MqttClientPayloadBuilder();
    builder.addString(commande);
    client.publishMessage('home/command', mqtt.MqttQos.exactlyOnce, builder.payload!);
  }

  void disconnect() {
    print('Déconnexion du broker MQTT.');
    client.disconnect();
  }

  void onConnected() {
    print('Connexion réussie.');
  }

  void onDisconnected() {
    print('Déconnecté du broker.');
  }
}

extension on mqtt.MqttMessage {
  get payload => null;
}

extension on mqtt.MqttConnectMessage {
  withCredentials(String username, String password) {}
}
