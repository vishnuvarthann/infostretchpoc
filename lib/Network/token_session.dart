import 'package:petfitproject/Network/api_response.dart';
import 'package:petfitproject/Network/http_response_code.dart';

abstract class ITokenHelper {
  bool isTokenExpired(int statusCode);

  Future<APIResponse?> reAuthenticateAndUpdateSession();
}

class TokenHelper implements ITokenHelper {
  @override
  bool isTokenExpired(int statusCode) {
    return statusCode.isTokenExpired();
  }

  @override
  Future<APIResponse?> reAuthenticateAndUpdateSession() async {
    //return LoginService().login('username', 'password');
  }
}
