import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:petfitproject/Network/internet_exception.dart';
import 'package:petfitproject/Network/request_type.dart';
import 'package:petfitproject/Network/token_session.dart';
import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/Utility/utils.dart';

abstract class IAPIClient {
  Future<Response?> request(RequestType requestType, String url,
      {Map<String, String>? headers, Object? body});
}

typedef ResponseCallback = Future<Response?> Function();

class APIClient implements IAPIClient {
  static APIClient? _instance;

  APIClient._();

  static APIClient getInstance() {
    return _instance ??= APIClient._();
  }

  @override
  Future<Response?> request(RequestType requestType, String url,
      {Map<String, String>? headers, Object? body}) async {
    if (await Utils.isInternetAvailable()) {
      late http.Response? response;
      switch (requestType) {
        case RequestType.GET:
          response = await _httpGet(url, headers: headers);
          break;
        case RequestType.POST:
          response = await _httpPost(url, headers, body);
          break;
        case RequestType.PUT:
          response = await _httpPut(url, headers: headers, body: body);
          break;
        case RequestType.DELETE:
          response = await _httpDelete(url, headers: headers, body: body);
          break;
      }
      var tokenHelper = TokenHelper();
      if (tokenHelper.isTokenExpired(response?.statusCode ?? 400)) {
        await tokenHelper.reAuthenticateAndUpdateSession();
        return request(requestType, url, headers: headers, body: body);
      } else {
        return response;
      }
    } else {
      throw NoInternetException('No internet connection');
    }
  }

  Future<Response?> _httpGet(String url, {Map<String, String>? headers}) async {
    return await http.get(Uri.parse(url), headers: headers).timeout(
        const Duration(minutes: NetworkconnectionTime.connectionTimeOut),
        onTimeout: () {
      return throw TimeoutException('Request timeout occurred.');
    });
  }

  Future<Response?> _httpPost(
      String url, Map<String, String>? headers, Object? body) async {
    var result = await http
        .post(Uri.parse(url), headers: headers, body: body)
        .timeout(
            const Duration(minutes: NetworkconnectionTime.connectionTimeOut),
            onTimeout: () {
      return throw TimeoutException('Request timeout occurred.');
    });
    return result;
  }

  Future<Response?> _httpPut(String url,
      {Map<String, String>? headers, Object? body}) async {
    var result = await http
        .put(Uri.parse(url), headers: headers, body: body)
        .timeout(
            const Duration(minutes: NetworkconnectionTime.connectionTimeOut),
            onTimeout: () {
      return throw TimeoutException('Request timeout occurred.');
    });
    return result;
  }

  Future<Response?> _httpDelete(String url,
      {Map<String, String>? headers, Object? body}) async {
    var result = await http
        .delete(Uri.parse(url), headers: headers, body: body)
        .timeout(
            const Duration(minutes: NetworkconnectionTime.connectionTimeOut),
            onTimeout: () {
      return throw TimeoutException('Request timeout occurred.');
    });
    return result;
  }
}
