import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:petfitproject/Utility/console.dart';
import 'package:petfitproject/bloc_cubit/bloc_base.dart';
import 'package:petfitproject/bloc_cubit/bloc_observer.dart';
import 'package:petfitproject/commonclass/routes.dart';
import 'package:petfitproject/dartclass/ImageLoader.dart';
import 'package:petfitproject/dartclass/appointmentHistory.dart';
import 'package:petfitproject/dartclass/login.dart';
import 'package:petfitproject/dartclass/peddashboard.dart';
import 'package:petfitproject/dartclass/addpet.dart';
import 'package:petfitproject/dartclass/feedback.dart';
import 'package:petfitproject/dartclass/petdetails.dart';
import 'package:petfitproject/dartclass/peddetailsview.dart';
import 'package:petfitproject/dartclass/signOut.dart';
import 'package:petfitproject/environment/environment.dart';
import 'package:petfitproject/ui/screens/medicalapp.dart';
import 'package:petfitproject/ui/screens/onboarding.dart';
import 'package:petfitproject/ui/screens/signIn.dart';
import 'package:petfitproject/ui/widgets/doctorProfile.dart';

void main() async {
  // var dio = Dio();
  // // final response = await dio.get(EnvironmentConstant.BASE_URL);
  // // print(response.data);
  await _setupEnvironment();
  await _setupFirebaseCrashlytics();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //FirebaseCrashlytics.instance.crash();
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: TodoBlocObserver());
}

Future<void> _setupEnvironment() async {
  Environment.initialize(Environment.DEV_ENVIRONMENT);
  await dotenv.load(fileName: Environment.getInstance().environment);
  Console.log(message: Environment.getInstance().apiUrl);
}

Future<void> _setupFirebaseCrashlytics() async {
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      //  initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        Routes.onBoardingScreen: (context) => OnBoardingScreen(),
        Routes.livenewsReport: (context) => const bloc_base(),
        Routes.doctorProfile: (context) => const DoctorProfile(),
        Routes.imageloader: (context) => const ImageLoader(),
        Routes.medicalappointment: (context) => const Medicalapp(),
        Routes.login: (context) => const Login(),
        Routes.pedDetailView: (context) => PedDetailsView(),
        Routes.feedback: (context) => const FeedBack(),
        Routes.pedlandingscreen: (context) => const PedDashBoard(),
        Routes.appointmenthistory: (context) => const AppointmentHistory(),
        Routes.petdetails: (context) => const petdetails(),
        Routes.addpet: (context) => const addpet(),
        Routes.detailpage: (context) => const SignIn(),
        Routes.sigout: (context) => const Signout(),
        //Routes.bloc_base: (context) => const bloc_base(),
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
        child: Image.asset('assets/images/petfitlogo.png'),
      ),
    );
  }
}
