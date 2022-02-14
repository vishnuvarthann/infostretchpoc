import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key, required String loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      color: Colors.black.withOpacity(0.6),
      child: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
