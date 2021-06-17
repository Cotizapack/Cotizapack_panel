import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/banner_model.dart';
import 'package:cotizaweb/app/data/models/isolatemodel.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';
import 'package:cotizaweb/app/data/provider/storage.dart';
import 'package:cotizaweb/app/data/services/file.dart';

class BannerServices {
  Database? database;

  Future<List<BannerModel>?> getallMyBanner() async {
    database = Database(AppwriteSettings.initAppwrite());
    try {
      Response result = await database!.listDocuments(
        collectionId: Collections.BANNERS,
        filters: ["enable=1"],
      );
      var banners = <BannerModel>[];
      for (var ban in result.data['documents']) {
        banners.add(BannerModel.fromMap(ban));
      }
      return banners;
    } on AppwriteException catch (e) {
      print('Error: ${e.message}');
      return null;
    }
  }

  Future<List<BannerModel>?> updateMyBanner(Isolateparam isolate) async {
    database = Database(AppwriteSettings.initAppwrite());
    try {
      if (isolate.image!.length > 0) {
        await MyStorage().deleteFile(fileId: isolate.banner!.image!);
        var resultImage = await MyStorage()
            .postFile(image: isolate.image!, filename: isolate.filename!);
        if (resultImage!.statusCode! == 500)
          throw 'Error de Servidor, Espere un momento';
        if (resultImage.statusCode! > 399) throw 'Error al subir el archivo';
        var myFile = MyFile.fromJson(resultImage.data);
        isolate.banner!.image = myFile.id;
      }

      Response result = await database!.updateDocument(
        collectionId: Collections.BANNERS,
        documentId: isolate.banner!.id!,
        data: isolate.banner!.toMap(),
      );
      if (result.statusCode == 200) {
        return getallMyBanner();
      }
      return null;
    } on AppwriteException catch (e) {
      print('Error: ${e.message}');
      return null;
    }
  }

  Future<List<BannerModel>?> saveMyBanner(Isolateparam isolate) async {
    database = Database(AppwriteSettings.initAppwrite());
    try {
      var resultImage = await MyStorage()
          .postFile(image: isolate.image!, filename: isolate.filename!);
      if (resultImage!.statusCode! == 500)
        throw 'Error de Servidor, Espere un momento';
      if (resultImage.statusCode! > 399) throw 'Error al subir el archivo';
      var myFile = MyFile.fromJson(resultImage.data);
      isolate.banner!.image = myFile.id;
      var result = await database!.createDocument(
          collectionId: Collections.BANNERS,
          data: isolate.banner!.toMap(),
          read: ['*'],
          write: ["team:${Collections.TEAMADMINID}"]);

      if (result.statusCode == 201) return getallMyBanner();

      return null;
    } on AppwriteException catch (e) {
      print('Error: ${e.message}');
      return null;
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
      print('Error: ${e.message}');
      return null;
    }
  }
}
