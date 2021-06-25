import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api {
////Internal constructor of the Api Class
  static final _api = Api._internal();
  factory Api() {
    return _api;
  }
  Api._internal();

  ///It return a [Response]
  Future<Response> getDataLnmOnline({path}) async {
    String username = 'test';
    String password = '123£';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    // Response r = await get('https://api.somewhere.io', headers: <String, String>{'authorization': basicAuth});
    // print(r.statusCode);
    // print(r.body);

    var data = await http
        .get(path, headers: <String, String>{'authorization': basicAuth});

    // print(data);
    return data;
  }

  Future<Response> getTotalBalance({path}) async {
    var data = await http.get(path);
    // print(data);
    return data;
  }

  Future<Response> getApiData({@required String path}) async => await http.get(path);

  Future<Response> postData({@required String path, @required data}) async {
    // print('[Api Main Post] Data: [ $data ] : [$path]');
    var rdata = await http.post('$path',
        body: data, headers: {"Content-Type": "application/json"});
    return rdata;
  }
}
