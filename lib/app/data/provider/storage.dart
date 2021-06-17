import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';

class MyStorage {
  Client client = Client();
  late Storage storage;

  Future<Response?> postFile(
      {required List<int> image, required String filename}) async {
    try {
      storage = Storage(AppwriteSettings.initAppwrite());
      Response result = await storage.createFile(
        file: MultipartFile.fromBytes(
          image,
          filename: filename,
        ),
        read: ["*"],
        write: ["*"],
      );
      return result;
    } catch (e) {
      print('Error storage: $e.message');
      return null;
    }
  }

  Future<Response?> deleteFile({required String fileId}) async {
    try {
      storage = Storage(AppwriteSettings.initAppwrite());
      Response res = await storage.deleteFile(fileId: fileId);
      print('Error update Storage');
      return res;
    } catch (e) {
      print('Error delete File: $e');
      return null;
    }
  }

  Future<Uint8List?> getFilePreview({required String fileId}) async {
    try {
      storage = Storage(AppwriteSettings.initAppwrite());
      var res = await storage.getFilePreview(fileId: fileId, quality: 1);
      return res.data;
    } on AppwriteException catch (e) {
      print('Error delete File: ${e.message}');
      return null;
    }
  }
}
