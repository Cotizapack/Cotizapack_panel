import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/banner_model.dart';
import 'package:cotizaweb/app/data/models/isolatemodel.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';
import 'package:cotizaweb/app/data/provider/storage.dart';
import 'package:get/get.dart';

class BannerServices {
  Database? database;

  Future<List<BannerModel>?> getallMyBanner() async {
    database = Database(AppwriteSettings.initAppwrite());
    try {
      DocumentList result = await database!.listDocuments(
        collectionId: Collections.BANNERS,
        filters: ["enable=1"],
      );
      var banners = <BannerModel>[];
      for (var ban in result.documents) {
        banners.add(BannerModel.fromMap(ban.data));
      }
      return banners;
    } on AppwriteException catch (e) {
      printError(info: "Banner Services Error: ${e.message}");

      throw e;
    }
  }

  Future<List<BannerModel>?> updateMyBanner(Isolateparam isolate) async {
    database = Database(AppwriteSettings.initAppwrite());
    try {
      if (isolate.image!.length > 0) {
        await MyStorage()
            .deleteFile(fileId: isolate.banner!.image!)
            .then((value) => print("Delete file"));
        File? file = await MyStorage()
            .postFile(image: isolate.image!, filename: isolate.filename!);

        if (file == null) throw 'Error al subir el archivo';
        isolate.banner!.image = file.$id;
      }

      Document result = await database!.updateDocument(
        collectionId: Collections.BANNERS,
        documentId: isolate.banner!.id!,
        data: isolate.banner!.toMap(),
      );
      if (result.data.isNotEmpty) {
        return getallMyBanner();
      }
      return null;
    } on AppwriteException catch (e) {
      printError(info: "Banner Services Error: ${e.message}");

      throw e;
    }
  }

  Future<List<BannerModel>?> saveMyBanner(Isolateparam isolate) async {
    database = Database(AppwriteSettings.initAppwrite());
    try {
      var file = await MyStorage()
          .postFile(image: isolate.image!, filename: isolate.filename!);
      if (file == null) throw 'Error al subir el archivo';
      isolate.banner!.image = file.$id;
      var result = await database!.createDocument(
          collectionId: Collections.BANNERS,
          data: isolate.banner!.toMap(),
          read: ['*'],
          write: ["team:${Collections.TEAMADMINID}"]);

      if (result.data.isNotEmpty) return getallMyBanner();

      return null;
    } on AppwriteException catch (e) {
      printError(info: "Banner Services Error: ${e.message}");
      throw e;
    }
  }

  Future<List<BannerModel>?> deleteMyBanner(Isolateparam isolate) async {
    database = Database(AppwriteSettings.initAppwrite());
    try {
      var resultImage =
          await MyStorage().deleteFile(fileId: isolate.banner!.image!);
      if (resultImage!.statusCode! == 500)
        throw 'Error de Servidor, Espere un momento';
      if (resultImage.statusCode! > 399) throw 'Error al subir el archivo';
      var result = await database!.deleteDocument(
        collectionId: Collections.BANNERS,
        documentId: isolate.banner!.id!,
      );

      if (result.statusCode! >= 200 && result.statusCode! <= 299)
        return getallMyBanner();

      return null;
    } on AppwriteException catch (e) {
      printError(info: "Banner Services Error: ${e.message}");
      throw e;
    }
  }
}
