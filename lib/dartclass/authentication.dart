// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import 'package:petfitproject/commonclass/loading.dart';
// import 'package:petfitproject/dartclass/login.dart';
// import 'package:petfitproject/pojoClass/logindata.dart';
// import 'package:petfitproject/sqflitedatabase/dbhelper.dart';
//
//
//
//
// class Authentication extends StatelessWidget {
//   const Authentication({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//             future: _checkForAuthentication(),
//             builder: (context, AsyncSnapshot<dynamic> snapshot) {
//               if (snapshot.hasData) {
//                 if (snapshot.data == true) {
//                   //_insert(HOME.username,HOME.password);
//                   return const Login();
//                  // return NavigationDrawer();
//                 } else {
//                   return const Login();
//                 }
//               } else {
//                 return Loader(loadingMessage: snapshot.data!.message);
//               }
//             }));
//   }
//
//   Future<bool> _checkForAuthentication() async {
//     return true;
//   }
//
//   Future<void> _insert(username, password) async {
//     final dbHelper = DatabaseHelper.instance;
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnName: username,
//       DatabaseHelper.columnpassword: password
//     };
//     loginData logindata = loginData.fromDatabaseJson(row);
//
//     final id = await dbHelper.insert(logindata);
//     Logger(printer: SimplePrinter(colors: true)).v(id);
//     //_showMessageInScaffold('inserted row id: $id');
//   }
// }
