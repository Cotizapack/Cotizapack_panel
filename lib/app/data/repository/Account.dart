import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/src/models/user.dart';
import 'package:cotizaweb/utils/appwriteInit.dart';
import 'package:cotizaweb/utils/constants.dart';

class AccountRepository{
  User _userData = User();
  Future<User> login({required User userData})async{
    Account account = Account(AppwriteSettings.initAppwrite());
    try{
      var res = await account.createSession(email: userData.email!, password: userData.password!);
      return _userData;
    }catch(e){
      print("Error: $e");
      return User.fromJson({});
    }
  }

  Future<bool> verifyAdminAccount({required String userID, required int status})async{
    bool isVerified = false; 
    Database database = Database(AppwriteSettings.initAppwrite());
    try{
      var res = await database.listDocuments(
        collectionId: admins,
        filters: [
          "userID=$userID"
        ]
      );
      if(res.statusCode == 200){
        if(res.data["sum"] > 0){
          isVerified = true;
        }
      }
      return isVerified;
    }catch(e){
      print("error verify admin account: $e");
      return false;
    }
  }
}