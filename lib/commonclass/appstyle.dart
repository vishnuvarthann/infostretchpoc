import 'package:flutter/material.dart';
import 'package:petfitproject/commonclass/fontfamily.dart';

class Styles {
  static const TextStyle headerStyles = TextStyle(
    fontFamily: FontFamily.robotoMono,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
  );

  static const TextStyle smallHit = TextStyle(
    fontFamily: FontFamily.robotoMono,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );
  static const TextStyle boldStyles = TextStyle(
    fontFamily: FontFamily.robotoMono,
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: 18.0,
  );

  static const TextStyle appheader = TextStyle(
    fontFamily: FontFamily.robotoMono,
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 21.0,
  );
  static const TextStyle buttonStyles = TextStyle(
    fontFamily: FontFamily.robotoMono,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.black,
  );

  static ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      padding:
          MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 0, 20, 0)),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 25)));
}
