import 'package:flutter/material.dart';

class RaisedButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final double height;
  final double width;
  final String route;
  final String id;

  

  const RaisedButton(
      {Key? key, this.title = '',
       this.color = Colors.blue,
      required this.onPressed,
      required this.id,
      required this.route,
      required this.height,
      required this.width}) : super(key: key);

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
              
              ),
             
              ),
        height: height,
        width: width,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16.0,),),
          onPressed: ()=> onPressed(route,context,id),
        ));
  }
}
