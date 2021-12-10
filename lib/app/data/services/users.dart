import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';

class UsersRepository {
  final String collectionID = Collections.USER;
  late Database database;

  Future<int> getUsers() async {
    try {
      database = Database(AppwriteSettings.initAppwrite());
      DocumentList res = await database
          .listDocuments(collectionId: collectionID, filters: ["enable=1"]);
      return res.sum;
    } catch (e) {
      print('Error get Users');
      return 0;
    }
  }
}
