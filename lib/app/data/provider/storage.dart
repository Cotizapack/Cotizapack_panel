import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';

class MyStorage {
  Client client = Client();
  late Storage storage;

  Future<File?> postFile(
      {required List<int> image, required String filename}) async {
    try {
      storage = Storage(AppwriteSettings.initAppwrite());
      File result = await storage.createFile(
        file: MultipartFile.fromBytes(
          "file",
          image,
          filename: filename,
        ),
        read: ["*"],
        write: ["*"],
      );
      return result;
    } on AppwriteException catch (e) {
      print('Error storage: ${e.message}');
      return null;
    }
  }

  Future<dynamic> deleteFile({required String fileId}) async {
    try {
      storage = Storage(AppwriteSettings.initAppwrite());
      return storage.deleteFile(fileId: fileId);
    } on AppwriteException catch (e) {
      print('Error delete File: ${e.message}');
      return null;
    }
  }

  Future<Uint8List?> getFilePreview({required String fileId}) async {
    try {
      storage = Storage(AppwriteSettings.initAppwrite());
      var res = await storage.getFilePreview(fileId: fileId, quality: 1);
      return res;
    } on AppwriteException catch (e) {
      print('Error get File: ${e.message}');
      return null;
    }
  }
}
