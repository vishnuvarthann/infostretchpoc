import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petfitproject/commonclass/routes.dart';
import 'package:petfitproject/dartclass/GridHeader.dart';
import 'package:petfitproject/dartclass/ImageLoader.dart';
import 'package:petfitproject/dartclass/login.dart';
import 'package:petfitproject/dartclass/peddashboard.dart';
import 'package:petfitproject/dartclass/addpet.dart';
import 'package:petfitproject/dartclass/feedback.dart';
import 'package:petfitproject/dartclass/petdetails.dart';
import 'package:petfitproject/dartclass/peddetailsview.dart';
import 'package:petfitproject/dartclass/signOut.dart';
import 'package:petfitproject/ui/screens/medicalapp.dart';
import 'package:petfitproject/ui/screens/onboarding.dart';
import 'package:petfitproject/ui/widgets/doctorProfile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      //  initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: {
        Routes.doctorProfile: (context) => const DoctorProfile(),
        Routes.onBoardingScreen: (context) => OnBoardingScreen(),
        Routes.imageloader: (context) => const ImageLoader(),
        Routes.medicalappointment: (context) => const Medicalapp(),
        Routes.login: (context) => const Login(),
        Routes.pedDetailView: (context) => PedDetailsView(),
        Routes.feedback: (context) => const FeedBack(),
        Routes.pedlandingscreen: (context) => const PedDashBoard(),
        // Routes.pedlandingscreen: (context) => const AddData(),
        Routes.petdetails: (context) => const petdetails(),
        Routes.addpet: (context) => const addpet(),
        Routes.detailpage: (context) => GridHeader(),
        Routes.sigout: (context) => const Signout()
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
    return Timer(_duration, navigationPage);
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
        child: Image.asset('assets/images/splashImages.png'),
      ),
    );
  }
}
