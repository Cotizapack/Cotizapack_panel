import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/models/my_account.dart';
import 'package:cotizaweb/app/data/models/token_reset_password.dart';
import 'package:cotizaweb/app/data/provider/appwrite.dart';

class AccountRepository {
  late Account account;
  Future<MyAccount?> getAccount() async {
    try {
      account = Account(AppwriteSettings.initAppwrite());
      Response res = await account.get();
      return MyAccount.fromJson(res.data);
    } catch (e) {
      print('Error getAccount: $e');
      return null;
    }
  }

  Future<MyAccount?> updatePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      account = Account(AppwriteSettings.initAppwrite());
      Response res = await account.updatePassword(
          oldPassword: oldPassword, password: newPassword);
      return MyAccount.fromJson(res.data);
    } catch (e) {
      print('Error getAccount: $e');
      return null;
    }
  }

  Future<TokenReset> createPasswordRecovery({required String email}) async {
    TokenReset token = TokenReset();
    try {
      account = Account(AppwriteSettings.initAppwrite());
      Response result = await account.createRecovery(
        email: email,
        url: 'https://cotizapack.com',
      );

      if (result.statusCode == 201) {
        token = TokenReset.fromJson(result.data);
      }
      return token;
    } catch (e) {
      return TokenReset.fromJson({});
    }
  }

  Future<TokenReset> completePasswordRecovery(
      {required TokenReset token,
      required String password1,
      required String password2}) async {
    TokenReset tokenResponse = TokenReset();
    try {
      Response result = await account.updateRecovery(
        userId: token.userId!,
        secret: token.secret!,
        password: password1,
        passwordAgain: password2,
      );

      if (result.statusCode! >= 201 && result.statusCode! <= 299) {
        tokenResponse = TokenReset.fromJson(result.data);
      }
      return tokenResponse;
    } catch (e) {
      return TokenReset.fromJson({});
    }
  }
}
