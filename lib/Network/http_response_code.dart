extension HttpResponseStatusCode on int {
  bool isStatusOK() {
    if (this >= 200 && this < 300) {
      return true;
    }
    return false;
  }

  bool isTokenExpired() {
    if (this == 404) {
      return true;
    } else {
      return false;
    }
  }
}
