import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/banner_model.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';

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

  Future<List<BannerModel>?> updateMyBanner(
      {required File file, BannerModel? banner}) async {
    database = Database(AppwriteSettings.initAppwrite());
    try {
      Response result = await database!.updateDocument(
        collectionId: Collections.BANNERS,
        documentId: banner!.id!,
        data: banner.toMap(),
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
}
