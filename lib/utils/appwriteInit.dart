import 'package:appwrite/appwrite.dart';

class AppwriteSettings {

  static Client initAppwrite(){
    Client client = Client();
    client
      .setEndpoint('https://104.236.201.156/v1') // Your Appwrite Endpoint
      .setProject('6080bf8f2d0d2') // Your project ID
      .setSelfSigned(); // Remove in production;
    return client;
  }
}