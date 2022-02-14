

import 'dart:core';

import 'package:petfitproject/sqflitedatabase/dbhelper.dart';

class loginData {
  int? id;
  String? username;
  String? password;

  loginData( this.id, this.username, this.password);

  loginData.fromDatabaseJson(Map<String, dynamic> map) {
    id = map['id'];
    username = map['username'];
    password = map['password'];
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnName: username,
      DatabaseHelper.columnpassword: password,
    };
  }


}