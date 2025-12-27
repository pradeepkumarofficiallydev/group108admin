// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:http/http.dart' as http;
//
// import '../AppExceptions.dart';
// import 'base_api_services.dart';
//
//  class   NetworkApiServices extends  BaseApiServices
// {
//
//
//   @override
//   Future getApi(String url) async {
//     dynamic responseJson;
//
//     try
//     {
//
//       //print( "eehdehdeh:");
//
//
//       var response= await http.get(Uri.parse(url)).timeout(const Duration( seconds: 30));
//
//         print("tttttststs"+response.body);
//
//         responseJson=returnResponse(response);
//
//
//
//        }
//        on
//
//       SocketException{
//
//       print("qqqqq");
//
//
//       throw  InternetException("") ;
//
//       }
//       on TimeoutException
//       {
//
//        throw  RequestTimeOut("Connection time out");
//
//
//       }
//
//       return responseJson;
//
//
//       }
//
//
//
//
//
//
//
//
//
//   @override
//   Future postApi(Map<String, dynamic> map,url) async {
//     dynamic responseJson;
//     try
//     {
//
//       print("tttttststs${map.toString()}");
//
//       print("tttttststs${url.toString()}");
//
//
//
//      // var body = json.encode(map);
//       var response= await http.post(Uri.parse(url),
//
//           body: map
//
//
//
//       ).timeout(const Duration( seconds: 40));
//
//       print("tttttststs"+response.body);
//
//
//       responseJson=returnResponse(response);
//
//
//
//     }
//     on
//
//     SocketException{
//
//       print("qqqqq");
//
//
//       throw  InternetException("") ;
//
//     }
//     on TimeoutException
//     {
//
//       throw  RequestTimeOut("Connection time out");
//
//
//     }
//   //
//      return responseJson;
//   //
//   //
//   }
//
//
//   dynamic returnResponse(http.Response response)
//   {
//     switch(response.statusCode)
//
//     {
//
//           case 200:
//
//           dynamic responsejson=jsonDecode(response.body);
//           print(response.statusCode);
//
//
//         return responsejson;
//
//
//
//       case 401:
//
//         dynamic responsejson=jsonDecode(response.body);
//         print(response.statusCode);
//
//
//         return responsejson;
//
//
//
//
//
//
//
//
//         case 400:
//         throw InvalidUrl;
//
//         default:
//
//           throw FetchDataException("Error accourd while communication with server");
//
//
//
//
//     }
//
//
//   }
//
//
//
//
//
//
// }


















import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../../utils/Preference.dart';
import '../../utils/Strings.dart';
import '../AppExceptions.dart';
import 'NetworkRequestInfo.dart';
import 'base_api_services.dart';

import 'package:fluttertoast/fluttertoast.dart';

class NetworkApiServices extends BaseApiServices {
  static final NetworkApiServices _instance = NetworkApiServices._internal();

  // Private constructor to prevent instantiation
  NetworkApiServices._internal() {
    // Initialize the ApiClient (which sets up Dio with interceptors)
    ApiClient();
    _getSharedPreferences();
  }

  factory NetworkApiServices() {
    return _instance;
  }

  String? accessToken = "";
  String? accessKey = "";









  // CancelToken? _cancelToken;
  //
  //
  // void cancelRequests() {
  //   _cancelToken?.cancel("Request cancelled by user");
  //   _cancelToken = CancelToken(); // Reset after cancellation
  // }
  //
  // CancelToken getCancelToken() {
  //   _cancelToken ??= CancelToken();
  //   return _cancelToken!;
  // }








  // CancelToken? _cancelToken;
  //
  // CancelToken _getCancelToken() {
  //   _cancelToken = CancelToken();
  //   return _cancelToken!;
  // }
  //
  // void cancelRequests() {
  //   if (_cancelToken != null && !_cancelToken!.isCancelled) {
  //     _cancelToken!.cancel("Cancelled previous request");
  //   }
  // }










  final Dio dio = Dio(BaseOptions(


    baseUrl: Strings.Url,
    // Can be modified for other URLs
    connectTimeout: const Duration(seconds: 100),
    receiveTimeout: const Duration(seconds: 100),
    // headers: {'Content-Type': 'application/json'},
  ));

  Future<void> _getSharedPreferences() async {
    // final SecureStorageService storageService = SecureStorageService();
    // // Retrieve token
    // accessToken = await storageService.getAccessToken();
    //
    //
    // accessToken = await storageService.getAccessToken();






    print("Stored Token: $accessToken");

    // accessToken="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJvYmoiOnsicm9sZSI6MSwidXNlcmlkIjoxMTY3ODI3NCwiZmlyc3RfbmFtZSI6InZpc2hhbCBqaSIsImxhc3RfbmFtZSI6IkRpeGl0IiwidXNlcm5hbWUiOiJkaXhpdHZpc2hhbGRpeGl0OTA4NEBnbWFpbC5jb20iLCJwaG9uZV9ubyI6IjkwODQwMjY4MTgiLCJsYW5ndWFnZV9pZCI6MSwibGFuZ19jb2RlIjoiRU4iLCJjdWx0dXJlX2lkIjoiNCIsInVzZXJfbG9jYXRpb24iOiJVUyIsImNvdW50cnlfaWQiOjEwMiwiaW1hZ2VfbmFtZSI6Imh0dHBzOi8vd3d3Lm9waW5pb25idXJlYXUuY29tL0RvY3VtZW50L1BhbmVsaXN0X3BpY3NfZW5jcnlwdGVkLy5wbmciLCJpcF9hZGRyZXNzIjoiMTE1LjI0Ni4xMjAuMjA2IiwibWVtYmVyc2luY2V5ZWFyIjoyMDI1LCJtZW1iZXJzaGlwX3N0YXR1cyI6IlAiLCJjdXJyZW5jeV9zeW1ib2wiOiLigrkiLCJkZW1vX3N1cnZleV90YWtlbiI6IlkiLCJ0aW1lWm9uZSI6IkFzaWEvQ2FsY3V0dGEiLCJjb3VudHJ5X2NvZGUiOiJJTiJ9LCJpYXQiOjE3Mzk1MzE5OTB9.401T9IDyMM1YKyUjTNRePoqxvscaIdoSff2vTrQCiKk";

    // Delete token
    // await storageService.deleteAccessToken();
  }


  ApiClient() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {

        print('Sending request to: ${options.uri}');
        print('Request Headers: ${options.headers}');
        print('Request Body: ${options.data}');

        print('content types: ${options.contentType}');

        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('Received responsess: ${response.statusCode}');

        print('Received: ${response.data}');

        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        int retryCount = 0;
        int maxRetries = 3;
        while (retryCount < maxRetries &&
            e.type == DioExceptionType.connectionTimeout) {
          retryCount++;
          try {
            print('Connection timeout, retrying...');
            final res = await dio.request(e.requestOptions.path);
            return handler.resolve(res);
          } catch (e) {
            print(e.toString());
          }
        }
        return handler.next(e);
      },
    ));
  }



  @override
  Future getApi(String url, {Map<String, dynamic>? queryParams ,CancelToken? cancelToken  }) async {
    dynamic responseJson;


    await _getSharedPreferences();
    // Log API request details before making the call
    final requestInfo = NetworkRequestInfo(
        request_types: "GET",
        request_time: 'Pending',
        request_body: "No Body",
        status_code: "Pending",
        id: DateTime.now().toString(),
        url: '${Strings.Url}$url',

        request_header: "Accept: ${'Content-Type : application/json'}  \n ${{

          'x-access-token': accessToken,

        }}",
        response_data: "");
    logger.addRequest(requestInfo);






    try
    {
      print("eehdehdeh:${accessToken}");

      // var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));

      Stopwatch stopwatch = Stopwatch()..start();


      var response = await dio.get(
        url,
        queryParameters: queryParams,
        // cancelToken:  getCancelToken(),

        cancelToken:    cancelToken,      // Passing cancelToken if provided
        // Add cancelToken to the request

        options: Options(
          headers: {
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc0MzIyOTkyNSwianRpIjoiNGEwYzVmMjgtZWEzNi00ZmViLThlODktMTdkOTVmNDcwYzg3IiwidHlwZSI6ImFjY2VzcyIsImlkZW50aXR5IjoiZGV2LnZpc2hhbC5kaXhpdEBzdXJlcGFzcy5pbyIsIm5iZiI6MTc0MzIyOTkyNSwiZXhwIjoyMzczOTQ5OTI1LCJlbWFpbCI6InZpc2hhbC5kaXhpdEBzdXJlcGFzcy5pbyIsInRlbmFudF9pZCI6Im1haW4iLCJ1c2VyX2NsYWltcyI6eyJzY29wZXMiOlsidXNlciJdfX0.jlpD748_X60gP5r5gBcjH72_IMu4iCWoEVAdUI4kixY",
            //  "Authorization": "Bearer ${accessKey}",


            'x-access-token': accessToken,
            'Content-Type': 'application/json',
            // Set Content-Type
          },
        ),
      );



      print("Full Response: ${jsonEncode(response.data)}");


      stopwatch.stop();
      final updatedRequest = NetworkRequestInfo(
        request_time: '${stopwatch.elapsedMilliseconds} ms',
        request_body: "No Body",
        request_types: requestInfo.request_types,
        status_code: response!.statusCode.toString(),
        id: requestInfo.id,
        url: '${Strings.Url}$url',
        response_data: "${jsonEncode(response.data)}",
        request_header: "Accept: ${'Content-Type : application/json'}  \n ${{
          'x-access-token': accessToken,
        }}",
      );




      logger.requests.remove(requestInfo);
      logger.addRequest(updatedRequest);
      responseJson = returnResponse(response);




      // print("hello");


    }

    //
    //  on SocketException {
    //   print("qqqqq");
    //   throw InternetException("");
    // } on TimeoutException {
    //   throw RequestTimeOut("Connection time out");
    // }
    //






    on DioException catch (e) {
      print('DioException: ${e.message}');

      if (e.response != null) {
        print('Response Data: ${e.response!.data}');
        print('Response Status Code: ${e.response!.statusCode}');

        if (e.response!.statusCode == 404) {
          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';

          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          throw InvalidUrl('Bad request: ${e.response!.data}');
        } else if (e.response!.statusCode == 400) {

          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';




          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );


          responseJson =e.response!.data;
          print("responseJsonSS  ${responseJson.toString()}");



          // Fluttertoast.showToast(
          // msg: errorMessage,
          // toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.BOTTOM,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          // textColor: Colors.white,
          // fontSize: 16.0,
          // );
          //


          // throw InvalidUrl('Bad request: ${e.response!.data}');

        } else if (e.response!.statusCode == 201) {
          throw InvalidUrl('201 request: ${e.response!.data}');
        } else {
          throw FetchDataException(
              'Error occurred while communicating with server');
        }
      }
    } on SocketException {
      print("qqqqq");
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("Connection time out");
    }

    return responseJson;


  }




  @override
  Future putApi(Map<String, dynamic> map, url) async {
    dynamic responseJson;
    try {

      final requestInfo = NetworkRequestInfo(
          request_types: "PUT",
          request_time: 'Pending',
          request_body: map.toString(),
          status_code: "Pending",
          id: DateTime.now().toString(),
          url: '${Strings.Url}$url',
          request_header: "Accept: ${'Content-Type : application/json'}  \n ${{
            'x-access-token': accessToken,
          }}",
          response_data: "");
      logger.addRequest(requestInfo);



      Stopwatch stopwatch = Stopwatch()..start();

      // var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      var response = await dio.put(url,
          data: map,
          options: Options(
            headers: {

              'x-access-token': accessToken,
              'Content-Type': 'application/json', // Set Content-Type
            },
          ));

      print("tttttststs" + response.data.toString());





      final updatedRequest = NetworkRequestInfo(
        request_time: '${stopwatch.elapsedMilliseconds} ms',
        request_body: requestInfo.request_body,
        request_types: requestInfo.request_types,
        status_code: response!.statusCode.toString(),
        id: requestInfo.id,
        url: '${Strings.Url}$url',
        response_data: "${response!.data}",
        request_header: "Accept: ${'Content-Type : application/json'}  \n ${{
          'x-access-token': accessToken,
        }}",
      );



      logger.requests.remove(requestInfo);
      logger.addRequest(updatedRequest);
      responseJson = returnResponse(response);

    } on DioException catch (e) {


      print('DioException: ${e.message}');

      if (e.response != null) {
        print('Response Data: ${e.response!.data}');
        print('Response Status Code: ${e.response!.statusCode}');

        if (e.response!.statusCode == 404) {
          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';




          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );





          throw InvalidUrl('Bad request: ${e.response!.data}');
        } else if (e.response!.statusCode == 400) {

          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';

          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          throw InvalidUrl('Bad request: ${e.response!.data}');

        }

        else if (e.response!.statusCode == 201) {

          throw InvalidUrl('201 request: ${e.response!.data}');

        }


        else {


          throw FetchDataException('Error occurred while communicating with server');


        }
      }
    } on SocketException {
      print("qqqqq");
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("Connection time out");
    }

    return responseJson;
  }

  @override
  Future postApi(Map<String, dynamic> map, url) async {
    dynamic responseJson;

    var requestInfo;


    Stopwatch stopwatch = Stopwatch();



    try {
      print("first 1");




      requestInfo = NetworkRequestInfo(
          request_types: "POST",
          request_time: 'Pending',
          request_body: map.toString(),
          status_code: "Pending",
          id: DateTime.now().toString(),
          url: '${Strings.Url}$url',
          request_header: "Accept: ${'Content-Type : application/json'}  \n ${{
            'x-access-token': accessToken,
          }}",
          response_data: "");
      logger.addRequest(requestInfo);

      //stopwatch = Stopwatch()..start();

      stopwatch.start();




      var response = await dio.post(url,
          data: map,
          options: Options(
            headers: {



              "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc0MzIyOTkyNSwianRpIjoiNGEwYzVmMjgtZWEzNi00ZmViLThlODktMTdkOTVmNDcwYzg3IiwidHlwZSI6ImFjY2VzcyIsImlkZW50aXR5IjoiZGV2LnZpc2hhbC5kaXhpdEBzdXJlcGFzcy5pbyIsIm5iZiI6MTc0MzIyOTkyNSwiZXhwIjoyMzczOTQ5OTI1LCJlbWFpbCI6InZpc2hhbC5kaXhpdEBzdXJlcGFzcy5pbyIsInRlbmFudF9pZCI6Im1haW4iLCJ1c2VyX2NsYWltcyI6eyJzY29wZXMiOlsidXNlciJdfX0.jlpD748_X60gP5r5gBcjH72_IMu4iCWoEVAdUI4kixY",
              'x-access-token': accessToken,
              'Content-Type': 'application/json', // Set Content-Type

            },
          ));



      print("tttttststs" + response.data.toString());









/////////////


      // Response response = Response(
      //     data: {
      //       "success": true,
      //       "code": 200,
      //       "message": "Ok",
      //       "data": "Reward redeem request submit"
      //     },
      //     statusCode: 200,
      //     requestOptions: RequestOptions(path: ''),
      //   );
      //
      //
      //



      //// aadhaar card
      // await Future.delayed(Duration(seconds: 2));
      //
      // Response response = Response(
      //   data: {
      //     "success": true,
      //     "code": 200,
      //     "message": "OTP Sent.",
      //     "data": {
      //       "client_id": "aadhaar_v2_xkMPzxqdoohkHrSCtRFv",
      //       "otp_sent": true,
      //       "if_number": true,
      //       "valid_aadhaar": true,
      //       "status": "generate_otp_success"
      //     }
      //   },

      //   statusCode: 200,
      //   requestOptions: RequestOptions(path: ''),
      // );






      // error
      // await Future.delayed(Duration(seconds: 2));
      //
      // Response response = Response(
      //   data: {
      //     "success": false,
      //     "code": 422,
      //     "message": "Wrong Aadhaar Number",
      //     "data": {
      //       "client_id": "aadhaar_v2_bFPyxlAADuBrectsPgMS",
      //       "otp_sent": false,
      //       "valid_aadhaar": false,
      //       "if_number": false,
      //       "status": "invalid_aadhaar"
      //     }
      //   },
      //   statusCode: 422,
      //   requestOptions: RequestOptions(path: ''),
      // );






      //// summit redmption
      // Response response = Response(
      //     data: {
      //       "success": true,
      //       "code": 200,
      //       "message": "Ok",
      //       "data": {
      //         "isIdProofPresent": false,
      //         "idProofPopupMessage": "As per the RBI circular, it is mandatory for us to verify your Aadhaar Number or PAN Card if you wish to redeem your reward via UPI. Kindly verify one of these documents to continue with the redemption process.",
      //         "isUpiIdPresent": false,
      //         "upiPopupMessage": "Add UPI Id"
      //       }
      //     },
      //   statusCode: 200,
      //   requestOptions: RequestOptions(path: ''),
      //    );
      //
      //







      // Response response = Response(
      //   data: {
      //     "data": {
      //       "client_id": "aadhaar_v2_xkMPzxqdoohkHrSCtRFv",
      //       "otp_sent": true,
      //       "if_number": true,
      //       "valid_aadhaar": true,
      //       "status": "generate_otp_success"
      //     },
      //     "status_code": 200,  // correct key
      //     "message_code": "success",
      //     "message": "OTP Sent.",
      //     "success": true
      //   },
      //   statusCode: 200,
      //   requestOptions: RequestOptions(path: ''),
      // );










      final updatedRequest = NetworkRequestInfo(
        request_time: '${stopwatch.elapsedMilliseconds} ms',
        request_body: requestInfo.request_body,
        request_types: requestInfo.request_types,
        status_code: response!.statusCode.toString(),
        id: requestInfo.id,
        url: '${Strings.Url}$url',
        response_data: "${response!.data}",
        request_header: "Accept: ${'Content-Type : application/json'}  \n ${{
          'x-access-token': accessToken,
        }}",
      );


      logger.requests.remove(requestInfo);
      logger.addRequest(updatedRequest);
      responseJson = returnResponse(response);


    } on DioException catch (e) {


      final updatedRequest = NetworkRequestInfo(
        request_time: '${stopwatch.elapsedMilliseconds} ms',
        request_body: requestInfo.request_body,
        request_types: requestInfo.request_types,
        status_code: e.response?.statusCode.toString()??"",
        id: requestInfo.id,
        url: '${Strings.Url}$url',
        response_data: "${e.response!.data}",
        request_header: "Accept: ${'Content-Type : application/json'}  \n ${{
          'x-access-token': accessToken,
        }}",
      );
      logger.requests.remove(requestInfo);
      logger.addRequest(updatedRequest);






      print('DioException: ${e.message}');
      if (e.response != null) {
        print('Response Data: ${e.response!.data}');
        print('Response Status Code: ${e.response!.statusCode}');

        if (e.response!.statusCode == 404) {
          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';








          if (errorMessage.trim() != "No work permits found for the given tenant.") {








              // Fluttertoast.showToast(
              //   msg: errorMessage,
              //   toastLength: Toast.LENGTH_SHORT,
              //   gravity: ToastGravity.BOTTOM,
              //   timeInSecForIosWeb: 1,
              //   backgroundColor: Colors.red,
              //   textColor: Colors.white,
              //   fontSize: 16.0,
              // );

            }






          throw InvalidUrl('Bad request: ${e.response!.data}');

        }


        else         if (e.response!.statusCode == 422) {
          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';


          // Fluttertoast.showToast(
          //   msg: errorMessage,
          //   toastLength: Toast.LENGTH_SHORT,
          //   gravity: ToastGravity.BOTTOM,
          //   timeInSecForIosWeb: 1,
          //   backgroundColor: Colors.red,
          //   textColor: Colors.white,
          //   fontSize: 16.0,
          // );




          throw InvalidUrl('Bad request: ${e.response!.data}');

        }




        else if (e.response!.statusCode == 400) {


          var responseData = e.response!.data;


          print('my message: ${e.response!}');


          responseJson = returnResponse(e.response!);


          //  responseJson = returnResponse(response);

          String errorMessage;

          if (responseData['message'] is String) {
            // Case 1: message is a direct string
            errorMessage = responseData['message'];



            if(errorMessage.toString()=="totalPointConvertRequestInOneDayExceed")
            {


              errorMessage= "Please note that you can submit maximum of two requests in a day. Please try again after 24 hours.";


            }






          } else if (responseData['message'] is Map<String, dynamic> &&
              responseData['message']?['validation_msg'] is String) {
            // Case 2: message is an object with validation_msg inside
            errorMessage = responseData['message']['validation_msg'];
          } else {
            // Case 3: message is missing or has an unexpected format
            errorMessage = 'Unknown error';
          }
          print("Error Message: $errorMessage");

          //
          // Fluttertoast.showToast(
          //   msg: errorMessage,
          //   toastLength: Toast.LENGTH_SHORT,
          //   gravity: ToastGravity.BOTTOM,
          //
          //   timeInSecForIosWeb: 1,
          //   backgroundColor: Colors.red,
          //   textColor: Colors.white,
          //   fontSize: 16.0,
          // );

          //
          //   throw InvalidUrl('Bad request: ${e.response!.data}');



        } else if (e.response!.statusCode == 201) {


          throw InvalidUrl('201 request: ${e.response!.data}');
        } else {
          throw FetchDataException(
              'Error occurred while communicating with server');
        }
      }
    } on SocketException {
      print("qqqqq");
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("Connection time out");
    }

    return responseJson;
  }







  @override
  Future deleteApi(Map<String, dynamic> map, url) async {
    dynamic responseJson;
    try {

      final requestInfo = NetworkRequestInfo(
          request_types: "PUT",
          request_time: 'Pending',
          request_body: map.toString(),
          status_code: "Pending",
          id: DateTime.now().toString(),
          url: '${Strings.Url}$url',
          request_header: "Accept: ${'Content-Type : application/json'}  \n ${{
            'x-access-token': accessToken,
          }}",
          response_data: "");
      logger.addRequest(requestInfo);



      Stopwatch stopwatch = Stopwatch()..start();

      // var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      var response = await dio.delete(url,
          data: map,
          options: Options(
            headers: {
              'x-access-token': accessToken,
              'Content-Type': 'application/json', // Set Content-Type
            },
          ));

      print("tttttststs" + response.data.toString());




      final updatedRequest = NetworkRequestInfo(
        request_time: '${stopwatch.elapsedMilliseconds} ms',
        request_body: requestInfo.request_body,
        request_types: requestInfo.request_types,
        status_code: response!.statusCode.toString(),
        id: requestInfo.id,
        url: '${Strings.Url}$url',
        response_data: "${response!.data}",
        request_header: "Accept: ${'Content-Type : application/json'}  \n ${{
          'x-access-token': accessToken,
        }}",
      );
      logger.requests.remove(requestInfo);
      logger.addRequest(updatedRequest);








      responseJson = returnResponse(response);


    } on DioException catch (e) {


      print('DioException: ${e.message}');

      if (e.response != null) {
        print('Response Data: ${e.response!.data}');
        print('Response Status Code: ${e.response!.statusCode}');

        if (e.response!.statusCode == 404) {
          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';

          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          throw InvalidUrl('Bad request: ${e.response!.data}');
        } else if (e.response!.statusCode == 400) {
          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';

          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          throw InvalidUrl('Bad request: ${e.response!.data}');
        } else if (e.response!.statusCode == 201) {
          throw InvalidUrl('201 request: ${e.response!.data}');
        } else {
          throw FetchDataException(
              'Error occurred while communicating with server');
        }
      }
    } on SocketException {
      print("qqqqq");
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("Connection time out");
    }

    return responseJson;
  }










  @override
  Future uploadBase64Image(Map<String, dynamic> map, url) async {
    var uri = Uri.parse("${Strings.Url}${url}"); // Replace with your API URL

    var response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        // body: jsonEncode({
        //   "image": url,
        //  // "filename": "image.png", // Optional: Provide a filename
        // }),

        body: map



    );

    if (response.statusCode == 200) {
      print("Image uploaded successfully");
    } else {
      print("Upload failed with status: ${response.statusCode}");
    }
  }







  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200 || 201 || 202 || 400 || 422 :

      // dynamic responsejson = jsonDecode(response.data);

        print('to response ${response.data}');
        //dynamic responsejson = response.data;


        dynamic responseJson;


        if (response.data is String) {
          print('main json data ${response.data}');

          responseJson = jsonDecode(response.data);
        } else {

          print('main data ${response.data}');
          responseJson = response.data;
        }
        print(response.statusCode);


        return responseJson;



    // case 400:
    //   throw InvalidUrl;
      default:
        throw FetchDataException(
            "Error occurred while communicating with server");
    }
  }
}
