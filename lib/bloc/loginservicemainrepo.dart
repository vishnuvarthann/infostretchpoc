import 'package:petfitproject/pojoClass/logindata.dart';
import 'package:petfitproject/sqflitedatabase/dbhelper.dart';

class LoginServiceMainRepo {
  final _provider = DatabaseHelper.instance;
  Future<loginData> fetchBaseServiceData(user, password) async {
    final response = await _provider.getLogin(user, password);
    return loginData.fromDatabaseJson(response);
  }
}
