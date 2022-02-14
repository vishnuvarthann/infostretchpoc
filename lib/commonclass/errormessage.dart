import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;
  final Function onRetryPressed;
  const ErrorMessage({required Key key, required this.errorMessage, required this.onRetryPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          const ElevatedButton(
            child: Text('Retry', style: TextStyle(color: Colors.black)),
            onPressed: null,
          )
        ],
      ),
    );
  }
}