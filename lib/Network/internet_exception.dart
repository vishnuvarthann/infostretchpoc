class NoInternetException implements Exception {
  final String _exception;

  NoInternetException(this._exception);

  String get message => _exception;
}
