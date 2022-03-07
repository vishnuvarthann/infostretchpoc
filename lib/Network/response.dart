

import 'package:petfitproject/Network/request_state.dart';

class Response<T> {
  T response;
  RequestState state;
  String? errorMessage;

  Response(this.response, this.state, this.errorMessage);
}
