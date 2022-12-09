import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//get request , add(post) , delete , update(put) .
//@required == optional
//required == not optional == needed
class Api {
  //get request
  Future<dynamic> get({required String url, @required dynamic body, @required String? token}) async
  {    Map<String, String> headers = {};
  headers.addAll({
    'Content-Type': 'application/x-www-form-urlencoded',
  });
  if (token != null) {
    headers.addAll({
      'Authorization': 'bearer $token',
    });
  }

  http.Response response = await http.get(Uri.parse(url),headers: headers);
  if (response.statusCode == 200) {
    // List<dynamic> data = jsonDecode(response.body);
    return jsonDecode(response.body);
  } else {
    throw Exception(
        'there is a problem status code${response.statusCode} check it ');
  }
  }

//add request
  Future<dynamic> post(
      {required String url,
        @required dynamic body,
        @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'bearer $token',
      });
    }
    http.Response response =
    await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem status code${response.statusCode} check it in body ${jsonDecode(response.body)}');
    }
  }

  //put or update request
  Future<dynamic> put(
      {required String url,
        @required dynamic body,
        @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers.addAll({
        'Authorization': 'bearer $token',
      });
    }
    http.Response response =
    await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem status code${response.statusCode} check it in body ${jsonDecode(response.body)}');
    }
  }
}