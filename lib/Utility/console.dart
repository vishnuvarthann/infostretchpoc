import 'package:flutter/foundation.dart';

class Console {
  static void log(
      {String tag = 'inforstrechpoc Next', required String message}) {
    if (kDebugMode) {
      print(tag + ': ' + message);
    }
  }
}
