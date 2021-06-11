import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/banner_model.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';

class BannerServices {
  late final Database database;

  Future<BannerModel?> getallMyBanner() async {
    database = Database(AppwriteSettings.initAppwrite());
    try {
      Response result =
          await database.listDocuments(collectionId: Collections.BANNERS);
      // var data = jsonDecode(result.data.toString())['documends'];
      print(result.data.toString());
      // var banner = BannerModel.fromMap();
      // return banner;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
