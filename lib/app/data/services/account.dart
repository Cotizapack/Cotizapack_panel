import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cotizaweb/app/data/models/token_reset_password.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';

class AccountRepository {
  late Account account;
  Future<User?> getAccount() async {
    try {
      account = Account(AppwriteSettings.initAppwrite());
      User res = await account.get();
      return res;
    } catch (e) {
      print('Error getAccount: $e');
      return null;
    }
  }

  Future<User?> updatePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      account = Account(AppwriteSettings.initAppwrite());
      User res = await account.updatePassword(
          oldPassword: oldPassword, password: newPassword);
      return res;
    } on AppwriteException catch (e) {
      print('Error getAccount: ${e.message}');
      return null;
    }
  }

  Future<Token> createPasswordRecovery({required String email}) async {
    try {
      account = Account(AppwriteSettings.initAppwrite());
      Token result = await account.createRecovery(
        email: email,
        url: 'https://cotizapack.com',
      );
      return result;
    } on AppwriteException catch (e) {
      throw e;
    }
  }

  Future<Token> completePasswordRecovery(
      {required TokenReset token,
      required String password1,
      required String password2}) async {
    try {
      Token result = await account.updateRecovery(
        userId: token.userId!,
        secret: token.secret!,
        password: password1,
        passwordAgain: password2,
      );
      return result;
    } on AppwriteException catch (e) {
      print('Error CompletePassword: ${e.message}');
      throw e;
    }
  }
}
