import 'package:appwrite/appwrite.dart' as ap;
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/banner_model.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';
import 'package:get/get.dart';

class BannerServices extends GetxService {
  late final ap.Database database;

  Future<BannerModel?> getallMyBanner() async {
    database = ap.Database(AppwriteSettings.initAppwrite());
    try {
      ap.Response result =
          await database.listDocuments(collectionId: Collections.BANNERS);
      var banner = BannerModel.fromJson(result.data["documents"]);
      return banner;
    } catch (e) {
      return null;
    }
  }
}
