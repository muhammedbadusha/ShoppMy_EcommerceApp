import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:orgfirstproject/Repository/api_exception.dart';

class ApiClient {


   final String basePath = 'http://192.168.18.39:8000';
  static final String url = '';

  Future<Response> invokeAPI(String path, String method, Object? body
      ) async {
    Map<String, String> headerParams = {

    };
    Response response;
String signupurl=basePath+path;
    // String loginurl = loginbasePath ;
    // print(loginurl);
     print(signupurl);

    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;

    switch (method) {
      case "POST":
        response = await post(Uri.parse(signupurl), headers: {'content-Type': 'application/json',}, body: body);
        break;
      case "PUT":
        response = await put(Uri.parse(url), headers: {'content-Type': 'application/json',}, body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: nullableHeaderParams);
        break;
      case "POST_":
        response = await post(Uri.parse(url), headers:  {},body: body,);
        break;
      case "GET_":
        response = await post(Uri.parse(url), headers:  {},body: body,);
        break;
      default:
        response = await get(Uri.parse(url), headers: {'Accept': 'application/json','Content-Type': 'application/json'});
    }

    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode >= 400) {
      log(path +
          ' : ' +
          response.statusCode.toString() +
          ' : ' +
          response.body);

      throw ApiException(
          message: _decodeBodyBytes(response), statusCode: response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}

