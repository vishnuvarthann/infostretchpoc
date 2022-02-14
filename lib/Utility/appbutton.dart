import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final double height;
  final double width;
  final String route;
  final String id;

   const AppButton(
      {Key? key,
      this.title = '',
      this.color = Colors.yellow,
      required this.onPressed,
      required this.id,
      required this.route,
      required this.height,
      required this.width,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
            ],
          ),
        ),
        height: height,
        width: width,
        margin: const EdgeInsets.all(10),
        child: TextButton(
          child: Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          onPressed: () => onPressed(route, context, id),
        ));
  }
}
