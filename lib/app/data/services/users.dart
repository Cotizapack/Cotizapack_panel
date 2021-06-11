import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/common/Collections_api.dart';
import 'package:cotizaweb/app/data/models/user_data.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';

class UsersRepository {
  UserList _userList = UserList();
  final String collectionID = Collections.USER;
  late Database database;

  Future<UserList> getUsers() async {
    try {
      database = Database(AppwriteSettings.initAppwrite());
      Response res = await database
          .listDocuments(collectionId: collectionID, filters: ["enable=1"]);
      return _userList = UserList.fromJson(res.data['documents']);
    } catch (e) {
      print('Error get Users');
      return _userList;
    }
  }
}
