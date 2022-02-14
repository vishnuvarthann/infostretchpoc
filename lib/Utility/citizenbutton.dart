import 'package:flutter/material.dart';

class CitizenButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final double height;
  final double width;
  final Text text;

  const CitizenButton(
      {Key? key,
      this.title = '',
      required this.onPressed,
      this.color = Colors.blue,
      required this.height,
      required this.text,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF1976D2),
            Color(0xFF1976D2),
            Color(0xFF1976D2),
          ],
        )),
        height: height,
        width: width,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          // shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(38.0))),
          onPressed: onPressed(),
        ));
  }
}
