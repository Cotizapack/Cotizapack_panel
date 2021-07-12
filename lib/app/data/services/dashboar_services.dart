import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/PackageModel.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';

class DashBoarServices {
  Future<int> getcountapackages() async {
    var database = Database(AppwriteSettings.initAppwrite());
    try {
      var res = await database.listDocuments(collectionId: Collections.PACKAGE);

      return int.parse("${res.data["sum"]}");
    } on AppwriteException catch (e) {
      print('Error: ${e.message}');
      return 0;
    }
  }

  Future<int> getBuypackages() async {
    var database = Database(AppwriteSettings.initAppwrite());
    try {
      var res =
          await database.listDocuments(collectionId: Collections.BUYPACKAGE);

      return int.parse("${res.data["sum"]}");
    } on AppwriteException catch (e) {
      print('Error: ${e.message}');
      return 0;
    }
  }

  Future<int> getcountQuotation({int? status}) async {
    var database = Database(AppwriteSettings.initAppwrite());
    try {
      var res = await database.listDocuments(
          collectionId: Collections.QUOTATIONS,
          filters: status == null ? [] : ["status=$status"]);

      return int.parse("${res.data["sum"]}");
    } on AppwriteException catch (e) {
      print('Error: ${e.message}');
      return 0;
    }
  }

  Future<int> getCounUsers() async {
    try {
      var database = Database(AppwriteSettings.initAppwrite());
      Response res = await database
          .listDocuments(collectionId: Collections.USER, filters: ["enable=1"]);
      return int.parse("${res.data['sum']}");
    } on AppwriteException catch (e) {
      print('Error get Users ' + e.message!);
      return 0;
    }
  }

  Future<List<Packageclass>?> getLastPakages() async {
    var database = Database(AppwriteSettings.initAppwrite());
    try {
      var res = await database.listDocuments(
          collectionId: Collections.PACKAGE, limit: 10);
      List<Packageclass> list = (res.data["documents"])
          .map<Packageclass>((value) => Packageclass.fromMap(value))
          .toList();
      return list;
    } on AppwriteException catch (e) {
      print('Error: ${e.message}');
      throw "Error: ${e.message}";
    }
  }
}
