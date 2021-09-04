import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/categories.dart';
import 'package:cotizaweb/app/data/models/isolateModelPackage.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';
import 'dart:async';
import 'dart:core';

class CategoryUserServices {
  final String collectionID = Collections.CATEGORYUSER;
  late Database _database;

  Future<List<UserCategory>?> getCategoryUser() async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      Response res = await _database.listDocuments(
        collectionId: collectionID,
      );
      List<UserCategory> list = (res.data["documents"])
          .map<UserCategory>((value) => UserCategory.fromJson(value))
          .toList();
      return list;
    } on AppwriteException catch (e) {
      print('Error get CategoryUser ${e.message}');
      throw e;
    }
  }

  Future<List<UserCategory>?> saveCategoryUser(IsolateparamPackage data) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      Response res = await _database.createDocument(
        collectionId: collectionID,
        data: data.package!.toMap(),
        read: ['*'],
        write: ['*'],
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 299)
        return getCategoryUser();
    } on AppwriteException catch (e) {
      print('Error create CategoryUser ${e.message}');
      throw e;
    }
  }

  Future<List<UserCategory>?> updateCategoryUser(IsolateparamPackage data) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      Response res = await _database.updateDocument(
        collectionId: collectionID,
        documentId: data.package!.id!,
        data: data.package!.toMap(),
        read: ['*'],
        write: ['*'],
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 299)
        return getCategoryUser();
    } on AppwriteException catch (e) {
      print('Error update CategoryUser ${e.message}');
      throw e;
    }
  }

  Future<List<UserCategory>?> deteleCategoryUser(IsolateparamPackage data) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      Response res = await _database.deleteDocument(
        collectionId: collectionID,
        documentId: data.package!.id!,
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 299)
        return getCategoryUser();
    } on AppwriteException catch (e) {
      print('Error delete CategoryUser ${e.message}');
      throw e;
    }
  }
}
