import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/PackageModel.dart';
import 'package:cotizaweb/app/data/models/file.dart';
import 'package:cotizaweb/app/data/models/isolateModelPackage.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';
import 'package:cotizaweb/app/data/provider/storage.dart';
import 'dart:async';
import 'dart:core';

class PackageRepository {
  final String collectionID = Collections.PACKAGE;
  late Database _database;

  Future<List<Packageclass>?> getPackages() async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      Response res = await _database.listDocuments(
        collectionId: collectionID,
      );
      List<Packageclass> list = (res.data["documents"])
          .map<Packageclass>((value) => Packageclass.fromMap(value))
          .toList();
      return list;
    } on AppwriteException catch (e) {
      print('Error get Package ${e.message}');
      throw e;
    }
  }

  Future<List<Packageclass>?> savePackage(IsolateparamPackage data) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      var resultImage = await MyStorage()
          .postFile(image: data.image!, filename: data.filename!);
      if (resultImage!.statusCode! == 500)
        throw 'Error de Servidor, Espere un momento';
      if (resultImage.statusCode! > 399) throw 'Error al subir el archivo';
      var myFile = MyFile.fromJson(resultImage.data);
      data.package!.image = myFile.id;
      Response res = await _database.createDocument(
        collectionId: collectionID,
        data: data.package!.toMap(),
        read: ['*'],
        write: ['*'],
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 299)
        return getPackages();
    } on AppwriteException catch (e) {
      print('Error create Package ${e.message}');
      throw e;
    }
  }

  Future<List<Packageclass>?> updatePackages(IsolateparamPackage data) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      if (data.image!.length > 0) {
        await MyStorage().deleteFile(fileId: data.package!.image!);
        var resultImage = await MyStorage()
            .postFile(image: data.image!, filename: data.filename!);
        if (resultImage!.statusCode! == 500)
          throw 'Error de Servidor, Espere un momento';
        if (resultImage.statusCode! > 399) throw 'Error al subir el archivo';
        var myFile = MyFile.fromJson(resultImage.data);
        data.package!.image = myFile.id;
      }
      Response res = await _database.updateDocument(
        collectionId: collectionID,
        documentId: data.package!.id!,
        data: data.package!.toMap(),
        read: ['*'],
        write: ['*'],
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 299)
        return getPackages();
    } on AppwriteException catch (e) {
      print('Error create Package ${e.message}');
      throw e;
    }
  }

  Future<List<Packageclass>?> detelePackages(IsolateparamPackage data) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      var resultImage =
          await MyStorage().deleteFile(fileId: data.package!.image!);
      if (resultImage!.statusCode! == 500)
        throw 'Error de Servidor, Espere un momento';
      if (resultImage.statusCode! > 399) throw 'Error al subir el archivo';
      Response res = await _database.deleteDocument(
        collectionId: collectionID,
        documentId: data.package!.id!,
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 299)
        return getPackages();
    } on AppwriteException catch (e) {
      print('Error create Package ${e.message}');
      throw e;
    }
  }
}
