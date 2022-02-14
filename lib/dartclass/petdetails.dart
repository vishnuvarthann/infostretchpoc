import 'package:flutter/material.dart';

// ignore: camel_case_types
class petdetails extends StatelessWidget {
  const petdetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
        flex: 1,
        child: Container(alignment: Alignment.center, child: const Text('A')),
      ),
      Flexible(
        flex: 1,
        child: Container(alignment: Alignment.center, child: const Text('B')),
      ),
    ]);
  }
}
