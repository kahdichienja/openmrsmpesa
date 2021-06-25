import 'dart:convert';

import 'package:billingapp/services/mpesa_api_response.dart';
import 'package:billingapp/services/mpesa_base_api.dart';
import 'package:billingapp/services/payment_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class PaymentController extends MpesaBaseApiProvider {
  ApiMpesaService _apiMpesaService = ApiMpesaService();
  Future<MpesaApiResponse> makePayment({
    @required String amount,
    @required String phoneNumber,
  }) async {
    try {
      setBusy(true);

      ///[Response] from the [API]
      ///
      print(amount);
      print(phoneNumber);
      
      Response response = await _apiMpesaService.lnmOnline(
        amount: amount,
        phoneNumber: phoneNumber,
      );

      ///[PRINT]s [API] response for [DEBUG] purposes
      // print('[API PROVIDER RESPONSE] ${response.body}');

      ///[Validation] if the fetch was a [SUCCESS]
      if (response.statusCode == 200) {
        setBusy(false);

        ///Return [DATA] of type [MpesaApiResponse] which wraps [data,hasError,List of Errors]
        ///This will return an instance of [MpesaApiResponse] containig [Instance of DeliveryStatusResponse,hasError(false),error message (null) ]

        /**
         * Since Presitge dont provide a request for all deliveries
         * You can save the response to FIrebase or whichever Data you are using here
         * i.e [Firebase.fucntion(add the response with the user id)]        
         * 
         *  * 
         */
        // jsonDecode(jsonString);
        // Map<String, dynamic> data= jsonDecode(response.body);
        // print(data);
        return MpesaApiResponse(json.decode(response.body), false, null);
      } else {
        setBusy(false);

        /// if there is an error in the response
        /// this is the data returned
        /// ///This will return an instance of [MpesaApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
        return MpesaApiResponse(
          null,
          true,
          ['Saver Err'],
        );
      }
    } catch (e) {
      setBusy(false);

      /// if there is an error in the [HTTP REQUEST]
      /// this is the data returned
      /// ///This will return an instance of [MpesaApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
      return MpesaApiResponse(null, true, [e.toString()]);
    }
  }
}
