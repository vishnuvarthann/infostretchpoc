import 'package:flutter/material.dart';
import 'package:petfitproject/Utility/appbutton.dart';
import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/commonclass/appstyle.dart';
import 'package:petfitproject/ui/global.dart';
import 'package:petfitproject/ui/screens/medicalapp.dart';

class OnBoardingScreen extends StatelessWidget {
  final _pageController = PageController();

  OnBoardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: const Text(
                    "Skip",
                    style: Styles.headerStyles,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Medicalapp())),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onBoardingInstructions.length,
                  itemBuilder: (context, i) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child:
                            Image.asset("${onBoardingInstructions[i].image}"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingInstructions.length,
                          (f) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              shape:
                                  f == i ? BoxShape.rectangle : BoxShape.circle,
                              color: f == i ? Colors.blueAccent : Colors.grey,
                              borderRadius:
                                  f == i ? BorderRadius.circular(5.0) : null,
                            ),
                            width: f == i ? 15 : 5,
                            height: 5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 11.0),
                      Text(
                        "${onBoardingInstructions[i].title}",
                        textAlign: TextAlign.center,
                        style: Styles.headerStyles,
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "${onBoardingInstructions[i].subtitle}",
                        textAlign: TextAlign.center,
                        style: Styles.boldStyles,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                    color: Colors.yellow,
                    id: "citizenservice",
                    width: size.width * 0.7,
                    height: size.height * 0.08,
                    onPressed: (route, count, id) =>
                        _clicked(route, context, id),
                    route: '/Medicalapp',
                    title: HOME.loginPetA),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_clicked(route, context, id) async {
  Navigator.pushNamed(context, route, arguments: id);
}
