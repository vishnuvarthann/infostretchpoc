import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static const String DEV_ENVIRONMENT = ".env.development";
  static const String QA_ENVIRONMENT = ".env.qa";
  static const String PROD_ENVIRONMENT = ".env.production";

  static Environment? INSTANCE;

  static void initialize(String environment) {
    INSTANCE ??= Environment._(environment);
  }

  static Environment getInstance() {
    return INSTANCE!;
  }

  late String _environment;

  Environment._(String environment) {
    _environment = environment;
  }

  String get environment => kReleaseMode ? PROD_ENVIRONMENT : _environment;

  String get apiUrl => dotenv.env['API_URL'] ?? 'No URL Found';

  String get isProd => dotenv.env['isProd'] ?? 'No Data Found';
}
