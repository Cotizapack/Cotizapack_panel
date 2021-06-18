import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/controllers/pakage_controller.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/PakageModel.dart';
import 'package:cotizaweb/app/data/models/file.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';
import 'package:cotizaweb/app/data/provider/storage.dart';

class PakageRepository {
  final String collectionID = Collections.PACKAGE;
  late Database _database;

  Future<List<Pakageclass>?> getPackages() async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      Response res = await _database.listDocuments(
        collectionId: collectionID,
      );
      List<Pakageclass> list = (res.data["documents"])
          .map<Pakageclass>((value) => Pakageclass.fromMap(value))
          .toList();
      return list;
    } on AppwriteException catch (e) {
      print('Error get pakage ${e.message}');
      throw e;
    }
  }

  Future<List<Pakageclass>?> savePackage(Isolateparam isolate) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      var resultImage = await MyStorage()
          .postFile(image: isolate.image!, filename: isolate.filename!);
      if (resultImage!.statusCode! == 500)
        throw 'Error de Servidor, Espere un momento';
      if (resultImage.statusCode! > 399) throw 'Error al subir el archivo';
      var myFile = MyFile.fromJson(resultImage.data);
      isolate.pakage!.image = myFile.id;
      Response res = await _database.createDocument(
        collectionId: collectionID,
        data: isolate.pakage!.toMap(),
        read: ['*'],
        write: ['*'],
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 299)
        return getPackages();
    } on AppwriteException catch (e) {
      print('Error create pakage ${e.message}');
      throw e;
    }
  }

  Future<List<Pakageclass>?> updatePackages(Isolateparam isolate) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      if (isolate.image!.length > 0) {
        await MyStorage().deleteFile(fileId: isolate.pakage!.image!);
        var resultImage = await MyStorage()
            .postFile(image: isolate.image!, filename: isolate.filename!);
        if (resultImage!.statusCode! == 500)
          throw 'Error de Servidor, Espere un momento';
        if (resultImage.statusCode! > 399) throw 'Error al subir el archivo';
        var myFile = MyFile.fromJson(resultImage.data);
        isolate.pakage!.image = myFile.id;
      }
      Response res = await _database.updateDocument(
        collectionId: collectionID,
        documentId: isolate.pakage!.id!,
        data: isolate.pakage!.toMap(),
        read: ['*'],
        write: ['*'],
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 299)
        return getPackages();
    } on AppwriteException catch (e) {
      print('Error create pakage ${e.message}');
      throw e;
    }
  }

  Future<List<Pakageclass>?> detelePackages(Isolateparam isolate) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      var resultImage =
          await MyStorage().deleteFile(fileId: isolate.pakage!.image!);
      if (resultImage!.statusCode! == 500)
        throw 'Error de Servidor, Espere un momento';
      if (resultImage.statusCode! > 399) throw 'Error al subir el archivo';
      Response res = await _database.deleteDocument(
        collectionId: collectionID,
        documentId: isolate.pakage!.id!,
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 299)
        return getPackages();
    } on AppwriteException catch (e) {
      print('Error create pakage ${e.message}');
      throw e;
    }
  }
}
