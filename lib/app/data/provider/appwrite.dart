import 'package:appwrite/appwrite.dart';

class AppwriteSettings {
  static const endPoint = 'https://server.cotizapack.com/v1';
  static const projectID = '612d32add254f';

  // .setEndpoint('https://104.236.201.156/v1') // Your Appwrite Endpoint
  // .setProject('6080bf8f2d0d2') // Your project ID
  static Client initAppwrite() {
    Client client = Client();
    client
        .setEndpoint('$endPoint') // Your Appwrite Endpoint
        .setSelfSigned(status: true)
        .setProject('$projectID'); // Your project ID

    return client;
  }
}
