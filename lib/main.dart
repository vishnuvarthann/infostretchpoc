import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petfitproject/dartclass/addpet.dart';
import 'package:petfitproject/dartclass/authentication.dart';
import 'package:petfitproject/dartclass/feedback.dart';
import 'package:petfitproject/dartclass/login.dart';
import 'package:petfitproject/dartclass/pedlandingscreen.dart';
import 'package:petfitproject/dartclass/petdetails.dart';
import 'package:petfitproject/dartclass/peddetailsview.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  const SplashScreen(),
      //  initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: {
       // '/Authentication': (context) => const Authentication(),
        '/login': (context) =>  Login(),
        '/pedDetailView':(context) =>const PedDetailsView(),
        '/feedback':(context) =>const FeedBack(),
        '/pedlandingscreen':(context) =>const pedlandingscreen(),
        '/petdetails':(context) =>const petdetails(),
        '/addpet':(context)=> const addpet()

      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = const Duration(seconds: 5);
    return  Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Image.asset('assets/images/animals.jpg'),
      ),
    );
  }
}