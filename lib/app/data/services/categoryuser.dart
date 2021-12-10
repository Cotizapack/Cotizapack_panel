import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/categories.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';
import 'dart:async';
import 'dart:core';

class CategoryUserServices {
  final String collectionID = Collections.CATEGORYUSER;
  late Database _database;

  Future<List<UserCategory>?> getCategoryUser() async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      DocumentList res = await _database.listDocuments(
        collectionId: collectionID,
        orderType: "ASC",
        orderField: 'name',
      );
      List<UserCategory> list = (res.documents)
          .map<UserCategory>((value) => UserCategory.fromJson(value.data))
          .toList();
      return list;
    } on AppwriteException catch (e) {
      print('Error get CategoryUser ${e.message}');
      throw e;
    }
  }

  Future<List<UserCategory>?> saveCategoryUser(UserCategory data) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      Document res = await _database.createDocument(
        collectionId: collectionID,
        data: data.toJson(),
        read: ['*'],
        write: ['*'],
      );
      if (res.data.isNotEmpty) return getCategoryUser();
    } on AppwriteException catch (e) {
      print('Error create CategoryUser ${e.message}');
      throw e;
    }
  }

  Future<List<UserCategory>?> updateCategoryUser(UserCategory data) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      Document res = await _database.updateDocument(
        collectionId: collectionID,
        documentId: data.id!,
        data: data.toJson(),
        read: ['*'],
        write: ['*'],
      );
      if (res.data.isNotEmpty) return getCategoryUser();
    } on AppwriteException catch (e) {
      print('Error update CategoryUser ${e.message}');
      throw e;
    }
  }

  Future<List<UserCategory>?> deteleCategoryUser(UserCategory data) async {
    _database = Database(AppwriteSettings.initAppwrite());
    try {
      await _database.deleteDocument(
        collectionId: collectionID,
        documentId: data.id!,
      );
      return getCategoryUser();
    } on AppwriteException catch (e) {
      print('Error delete CategoryUser ${e.message}');
      throw e;
    }
  }
}
