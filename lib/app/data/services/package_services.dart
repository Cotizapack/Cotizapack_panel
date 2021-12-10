import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/PackageModel.dart';
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
      DocumentList res = await _database.listDocuments(
        collectionId: collectionID,
      );
      List<Packageclass> list = (res.documents)
          .map<Packageclass>((value) => Packageclass.fromMap(value.data))
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
      var file = await MyStorage()
          .postFile(image: data.image!, filename: data.filename!);
      if (file == null) throw 'Error de Servidor, Espere un momento';

      data.package!.image = file.$id;
      Document res = await _database.createDocument(
        collectionId: collectionID,
        data: data.package!.toMap(),
        read: ['*'],
        write: ['*'],
      );
      if (res.data.isNotEmpty) return getPackages();
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
        var file = await MyStorage()
            .postFile(image: data.image!, filename: data.filename!);

        if (file == null) throw 'Error al subir el archivo';
        data.package!.image = file.$id;
      }
      Document res = await _database.updateDocument(
        collectionId: collectionID,
        documentId: data.package!.id!,
        data: data.package!.toMap(),
        read: ['*'],
        write: ['*'],
      );
      if (res.data.isNotEmpty) return getPackages();
    } on AppwriteException catch (e) {
      print('Error create Package ${e.message}');
      throw e;
    }
  }

  Future<List<Packageclass>?> detelePackages(IsolateparamPackage data) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      var file = await MyStorage().deleteFile(fileId: data.package!.image!);
      if (file == null) throw 'Error al subir el archivo';
      Document res = await _database.deleteDocument(
        collectionId: collectionID,
        documentId: data.package!.id!,
      );
      if (res.data.isNotEmpty) return getPackages();
    } on AppwriteException catch (e) {
      print('Error create Package ${e.message}');
      throw e;
    }
  }
}
