class APIResponse<T> {
  T? response;
  String? error;

  APIResponse(this.response, this.error);
}
