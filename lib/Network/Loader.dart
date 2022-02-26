import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color bckColor;
  // ignore: use_key_in_widget_constructors
  const Loader({this.bckColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: bckColor,
        ),
      ),
    );
  }
}
