import 'package:flutter/material.dart';
import 'package:petfitproject/ui/global.dart';

class OnBoardingScreen extends StatelessWidget {
  final _pageController = PageController();

  OnBoardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                  child: const Text("Skip"),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, 'home'),
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
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "${onBoardingInstructions[i].subtitle}",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: MyColors.blue,
                  child: Text(
                    "Next",
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {
                    if (onBoardingInstructions.length - 1 ==
                        _pageController.page) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeIn);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
