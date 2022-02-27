import 'package:flutter/material.dart';
import 'package:petfitproject/Utility/appbutton.dart';
import 'package:petfitproject/Utility/constants.dart';

class LandingFragment extends StatefulWidget {
  const LandingFragment({Key? key}) : super(key: key);

  @override
  _LandingFragmentState createState() => _LandingFragmentState();
}

class _LandingFragmentState extends State<LandingFragment> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: null,
        child: Scaffold(
            backgroundColor: Colors.grey,
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        HOME.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset('assets/images/petfit.jpg',
                            width: 100, height: 100),
                      ),
                      AppButton(
                          id: "citizenservice",
                          width: size.width * 0.7,
                          height: size.height * 0.08,
                          onPressed: (route, count, id) =>
                              _clicked(route, context, id),
                          route: '/citizenservice',
                          title: HOME.loginPetA),
                      AppButton(
                        id: 'authorityUser',
                        width: size.width * 0.7,
                        height: size.height * 0.08,
                        onPressed: (route, count, id) =>
                            _clicked(route, context, id),
                        route: '/login',
                        title: HOME.loginPet,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                        child: Text(
                          LoginString.termsconditions,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decorationStyle: TextDecorationStyle.wavy,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Text(
                        LoginString.termshint,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          decorationStyle: TextDecorationStyle.wavy,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  _clicked(route, context, id) async {
    _serviceCall(id);
    Navigator.pushNamed(context, route, arguments: id);
  }

  _serviceCall(id) {}

  // Future<bool> _onBackPressed() {
  //   return showDialog(
  //         context: context,
  //         builder: (context) => new AlertDialog(
  //           title: new Text('Are you sure?'),
  //           content: new Text('Do you want to exit an App'),
  //           actions: <Widget>[
  //             new GestureDetector(
  //               onTap: () => Navigator.of(context).pop(false),
  //               child: Text("NO"),
  //             ),
  //             SizedBox(height: 16),
  //             new GestureDetector(
  //               onTap: () => Navigator.of(context).pop(true),
  //               child: Text("YES"),
  //             ),
  //           ],
  //         ),
  //       ) ??
  //       false;
  // }
}
