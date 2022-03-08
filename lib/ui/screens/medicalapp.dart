import 'package:flutter/material.dart';
import 'package:petfitproject/ui/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding.dart';

class Medicalapp extends StatefulWidget {
  const Medicalapp({Key? key}) : super(key: key);

  @override
  _MedicalappState createState() => _MedicalappState();
}

class _MedicalappState extends State<Medicalapp> {
  // ignore: prefer_typing_uninitialized_variables
  var _checkIsFirstSeen;
  @override
  void initState() {
    super.initState();
    _checkIsFirstSeen = checkIsFirstSeen();
  }

  Future<bool> checkIsFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("seen")) {
      return true;
    } else {
      prefs.setBool("seen", true);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Fit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: FutureBuilder(
        future: _checkIsFirstSeen,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return const HomeScreen();
            } else {
              return OnBoardingScreen();
            }
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
      routes: {
        'home': (context) => const HomeScreen(),
      },
    );
  }
}
