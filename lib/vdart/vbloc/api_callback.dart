abstract class APICallback<T> {
  
  void onSuccess(T response);

  void onFail(String errorMessage);
}
