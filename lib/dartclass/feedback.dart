import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/commonclass/appstyle.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController textarea = TextEditingController();
  late String ratingValue = "neutral";
  final int _ratingBarMode = 3;
  final double _initialRating = 3.0;
  Color _colorselected1 = Colors.black;
  Color _colorselected2 = Colors.black;
  Color _colorselected3 = Colors.black;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          appBarTheme: const AppBarTheme(),
        ),
        home: Scaffold(
          appBar: AppBar(
            elevation: 0.1,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
            title: const Text('FeedBack', style: Styles.appheader),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/petfit.jpg',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  _heading(HOME.feedbackhint),
                  _headingmediam(HOME.feedbackhints),
                  _headingsmall(HOME.feedbacklite),
                  _ratingBar(_ratingBarMode),
                  const SizedBox(height: 20.0),
                  Text(
                    ratingValue,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _headingmediam(HOME.feedbackints),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selected(1);
                              });
                            },
                            child: Container(
                                margin: const EdgeInsets.all(5.0),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: _colorselected1,
                                  border: Border.all(
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: const Center(
                                    child: Text("SUGGESTIONS",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)))),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selected(2);
                              });
                            },
                            child: Container(
                                margin: const EdgeInsets.all(5.0),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: _colorselected2,
                                  border: Border.all(
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: const Center(
                                    child: Text("COMPLAINTS",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)))),
                          ),
                        ),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selected(3);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: _colorselected3,
                                    border: Border.all(
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "COMPLIMENTS",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                                ))),
                      ]),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        TextField(
                          controller: textarea,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          decoration: const InputDecoration(
                              hintText: "Enter feedback please ..",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.redAccent))),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () => _customizedALERT(context),
                          child: const Text("Send")))
                ],
              ),
            ),
          ),
        ));
  }

  Widget _ratingBar(int mode) {
    switch (mode) {
      case 3:
        return RatingBar.builder(
          initialRating: _initialRating,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return const Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return const Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return const Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
              default:
                return Container();
            }
          },
          onRatingUpdate: (rating) {
            if (rating == 1) {
              setState(() {
                ratingValue = "very dissatisfied";
              });
            } else if (rating == 2) {
              setState(() {
                ratingValue = "dissatisfied";
              });
            } else if (rating == 3) {
              setState(() {
                ratingValue = "neutral";
              });
            } else if (rating == 4) {
              setState(() {
                ratingValue = "satisfied";
              });
            } else if (rating == 5) {
              setState(() {
                ratingValue = "very_satisfied";
              });
            }
          },
          updateOnDrag: true,
        );
      default:
        return Container();
    }
  }

  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );

  void _selected(int i) {
    switch (i) {
      case 1:
        setState(() {
          _colorselected1 = Colors.blue;
          _colorselected2 = Colors.black;
          _colorselected3 = Colors.black;
        });
        break;
      case 2:
        setState(() {
          _colorselected1 = Colors.black;
          _colorselected2 = Colors.blue;
          _colorselected3 = Colors.black;
        });
        break;
      case 3:
        setState(() {
          _colorselected1 = Colors.black;
          _colorselected2 = Colors.black;
          _colorselected3 = Colors.blue;
        });
    }
  }
  // setState(() {
  //   if (i == 1){
  //     _colorselected1 = Colors.blue;
  //   }else {
  //     _colorselected2 = Colors.black;
  //     _colorselected3 = Colors.black;
  //   }
  // });

}

Widget _headingmediam(String text) => Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
Widget _headingsmall(String text) => Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    );
void _customizedALERT(BuildContext context) {
  Alert(
    context: context,
    type: AlertType.none,
    title: Trackservice.trackservice,
    desc: Trackservice.trackhint,
    buttons: [
      DialogButton(
        child: Text(
          Trackservice.mobileNo,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () => Navigator.of(context).pop(),
      )
    ],
  ).show();
}
