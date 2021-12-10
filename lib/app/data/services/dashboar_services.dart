import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/PackageModel.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';
import 'package:get/get.dart';

class DashBoarServices {
  Future<int> getcountapackages() async {
    var database = Database(AppwriteSettings.initAppwrite());
    try {
      var res = await database.listDocuments(collectionId: Collections.PACKAGE);

      return res.sum;
    } on AppwriteException catch (e) {
      printError(info: "DashBoarServices Error :${e.message}");
      return 0;
    }
  }

  Future<int> getBuypackages() async {
    var database = Database(AppwriteSettings.initAppwrite());
    try {
      var res =
          await database.listDocuments(collectionId: Collections.BUYPACKAGE);

      return res.sum;
    } on AppwriteException catch (e) {
      printError(info: "DashBoarServices Error :${e.message}");

      throw e;
    }
  }

  Future<int> getcountQuotation({int? status}) async {
    var database = Database(AppwriteSettings.initAppwrite());
    try {
      var res = await database.listDocuments(
          collectionId: Collections.QUOTATIONS,
          filters: status == null ? [] : ["status=$status"]);

      return res.sum;
    } on AppwriteException catch (e) {
      printError(info: "DashBoarServices Error :${e.message}");
      return 0;
    }
  }

  Future<int> getCounUsers() async {
    try {
      var database = Database(AppwriteSettings.initAppwrite());
      var res = await database
          .listDocuments(collectionId: Collections.USER, filters: ["enable=1"]);
      return res.sum;
    } on AppwriteException catch (e) {
      printError(info: "DashBoarServices Error :${e.message}");
      throw e;
    }
  }

  Future<List<Packageclass>?> getLastPakages() async {
    var database = Database(AppwriteSettings.initAppwrite());
    try {
      var res = await database.listDocuments(
          collectionId: Collections.PACKAGE, limit: 10);
      List<Packageclass> list = (res.documents)
          .map<Packageclass>((value) => Packageclass.fromMap(value.data))
          .toList();
      return list;
    } on AppwriteException catch (e) {
      printError(info: "DashBoarServices Error :${e.message}");
      throw "Error: ${e.message}";
    }
  }
}
