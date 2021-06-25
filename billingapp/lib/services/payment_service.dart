import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'base_api.dart';
import 'urls.dart';

class ApiMpesaService extends MpesaBaseApi {
  String lnmfullPath =
      'https://us-central1-ecommerce-47123.cloudfunctions.net/opemMrsPaymentsAPI/v1/payments_api/lipanampesaOnlineSTK';

  Future<Response> lnmOnline({
    @required String amount,
    @required String phoneNumber,
  }) async =>
      api.getDataLnmOnline(path: '$lnmfullPath/$amount/$phoneNumber');

  Future<Response> getApiData({@required String path}) async => await http.get(path);

 
}
