import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:billingapp/controller/get_billable_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FetchNetworkDataService {
  static Future fetchJsonData(String url) {
    return http
        .get(url)
        .then((response) =>
            response?.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError(
          (err) => handleSocketException(),
          test: (e) => e is SocketException,
        )
        .catchError(
          (err) => handleTimeOutException(),
          test: (e) => e is TimeoutException,
        )
        .catchError(
          (err) => handleFormartException(),
          test: (e) => e is FormatException,
        );
  }

    static handleSocketException() {
    final obj = Get.find<GetBillableController>();
    obj.noDataobs(true);
    return Get.snackbar(
      'Ooop !!!',
      'Weak internet connection: Connect and Reload.',
      backgroundColor: Colors.amber,
    );
  }

  static handleTimeOutException() {
    return Get.snackbar(
      'Ooops !!!',
      'Connection Time Out.',
      backgroundColor: Colors.amber,
    );
  }

  static handleFormartException() {
    return Get.snackbar(
      'Ooops !!!',
      'Something Went Wrong.',
      backgroundColor: Colors.amber,
    );
  }
}
