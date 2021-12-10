import 'dart:async';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/common/alert.dart';
import 'package:cotizaweb/app/data/models/categories.dart';
import 'package:cotizaweb/app/data/models/user_data.dart';
import 'package:cotizaweb/app/data/models/user_model.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getImport;

class UserRepository {
  UserCategory userCategory = UserCategory(
      name: "", description: "", enable: true, collection: "", id: "");
  late Session session;
  late UserData userData = UserData(category: userCategory);
  final String userCollectionID = Collections.USER;
  late Database database;

  Future<User?> signup({required UserModel user}) async {
    Account account = Account(AppwriteSettings.initAppwrite());
    try {
      User result = await account.create(
          email: user.email.toString(),
          password: user.password.toString(),
          name: user.nickname.toString());
      return result;
    } catch (err) {
      print('ERROR: $err');
    }
  }

  Future<Session?> signIn({required UserModel user}) async {
    Account account = Account(AppwriteSettings.initAppwrite());

    try {
      Session response = await account.createSession(
          email: user.email.toString(), password: user.password.toString());

      return response;
    } on AppwriteException catch (e) {
      printError(
        info: 'Error: ${e.message}',
      );
      throw e;
    }
  }

  Future<MembershipList?> getTeam() async {
    Teams teams = Teams(AppwriteSettings.initAppwrite());
    try {
      MembershipList response = await teams.getMemberships(
        teamId: Collections.TEAMADMINID,
      );
      return response;
    } on AppwriteException catch (e) {
      printError(
        info: 'Error team: ${e.message}',
      );
      throw e;
    }
  }

  Future<Response?> logout() async {
    Account account = Account(AppwriteSettings.initAppwrite());
    try {
      Response response = await account.deleteSessions();
      return response;
    } catch (err) {
      print('Error $err');
    }
  }

  Future<User?> getSessions() async {
    try {
      Account account = Account(AppwriteSettings.initAppwrite());
      User response = await account.get();
      return response;
    } on AppwriteException catch (e) {
      print('Error getSessions: ${e.message}');
      throw e;
    }
  }

  Future<Session?> getUserSessionData() async {
    try {
      Account account = Account(AppwriteSettings.initAppwrite());
      SessionList response = await account.getSessions();
      session = response.sessions[0];
      return session;
    } on AppwriteException catch (e) {
      print('Error getSessions: ${e.message}');
      MyAlert.showMyDialog(
          title: 'Sesión caducada',
          message: 'Tu actual sesión está caducada, inicia sesión de nuevo',
          color: Colors.red);
      return null;
    }
  }

  Future<UserData> saveMyData({required Map<dynamic, dynamic> data}) async {
    try {
      database = Database(AppwriteSettings.initAppwrite());
      Document response = await database.createDocument(
          collectionId: userCollectionID,
          data: data,
          read: ["*"],
          write: ["user:${data["userID"]}"]);
      userData = UserData.fromJson(response.data);
      return userData;
    } catch (e) {
      print(e);
      return userData;
    }
  }

  Future<Document?> updateMyData({required UserData data}) async {
    try {
      printInfo(info: data.toJson().toString());
      database = Database(AppwriteSettings.initAppwrite());
      Document response = await database.updateDocument(
          collectionId: userCollectionID,
          documentId: data.id!,
          data: data.toJson(),
          read: ["*"],
          write: ["user:${data.userID}"]);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserData> chargeUserData({required String userID}) async {
    try {
      database = Database(AppwriteSettings.initAppwrite());
      DocumentList response = await database.listDocuments(
          collectionId: userCollectionID,
          filters: ["userID=$userID"],
          limit: 1);
      var data = response.documents[0].data;
      userData = UserData.fromJson(data);
      return userData;
    } catch (e) {
      print('Error charge Data $e');
      return userData;
    }
  }

  Future<bool> changePassword(
      {required String userID,
      required String secret,
      required String password,
      required String passwordagain}) async {
    try {
      var account = Account(AppwriteSettings.initAppwrite());
      Token response = await account.updateRecovery(
        userId: userID,
        secret: secret,
        password: password,
        passwordAgain: passwordagain,
      );

      return response.userId.length > 0 ? true : false;
    } on AppwriteException catch (e) {
      print('Error cange password ${e.message}');
      return false;
    }
  }
}
