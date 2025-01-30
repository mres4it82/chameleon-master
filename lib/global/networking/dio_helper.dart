import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/modules/login/controllers/login_controller.dart';
import '../../generated/locales.g.dart';
import '../constants/constants.dart';
import '../controllers/language_controller.dart';

class DioHelper {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: defaultHost,
    ),
  );

  Future<dynamic> getData(url, parms) async {
    late Response response;

    // check if user is initialized we add the token to header
    if (g.Get
        .find<LoginController>()
        .isUserIntialized
        .value) {
      dio.options.headers['Authorization'] =
          'Bearer ' + g.Get
              .find<LoginController>()
              .user
              .token!;
    }

    try {
      response = await dio.get(url, queryParameters: parms);
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        log('Request failed with status: ${e.response!.statusCode}');
        log('Response body: ${e.response!.data}');

        if (e.response!.statusCode == 400) {
          log('Bad Request: Please check your request parameters or body.');
        }

        return Future.value(e.response);
      } else {
        // Something else went wrong (e.g., no response)
        log('Error sending request: ${e.message}');
      }
    }

    return Future.value(response);
  }

  Future<dynamic> getDataBody(url, body) async {
    late Response response;

    // check if user is initialized we add the token to header
    if (g.Get
        .find<LoginController>()
        .isUserIntialized
        .value) {
      dio.options.headers['Authorization'] =
          'Bearer ' + g.Get
              .find<LoginController>()
              .user
              .token!;
    }

    try {
      response = await dio.get(url, data: body);
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        log('Request failed with status: ${e.response!.statusCode}');
        log('Response body: ${e.response!.data}');

        if (e.response!.statusCode == 400) {
          log('Bad Request: Please check your request parameters or body.');
        }

        return Future.value(e.response);
      } else {
        // Something else went wrong (e.g., no response)
        log('Error sending request: ${e.message}');
      }
    }

    return Future.value(response);
  }

  Future<dynamic> getDataWithoutParms(url, parms, BuildContext ctx) async {
    late Response response;

    Directory directory = await getTemporaryDirectory();
    final file = File('${directory.path}/filex.pdf');

    final options =
    Options(followRedirects: false, responseType: ResponseType.bytes);
    if (g.Get
        .find<LoginController>()
        .isUserIntialized
        .value) {
      log('bbbbbbbbbvvvvvvvvvvvvvvvv');
      dio.options.headers['Authorization'] =
          'Bearer ' + g.Get
              .find<LoginController>()
              .user
              .token!;
    }

    try {
      log('execute1 ..............');
      response = await dio.get(url,
          queryParameters: parms, options: options).whenComplete(() {
        log('whenComplete execute................');
      }).catchError((e) {
        var snackBar = SnackBar(
          content: Text(
            LocaleKeys.noDocument.tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: Get.find<LanguageController>().isArabic
                  ? 'ElMessiri'
                  : 'BalsamiqSans',
            ),
          ),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(ctx).showSnackBar(
          snackBar,
        );
        log('catchError execute................');
      });

      // log('response.data runtimeType =  ${response.data.runtimeType}');
      log('statusCode =  ${response.statusCode}');

      await file.writeAsBytes(response.data);
      await OpenFile.open(file.path);
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        log('Request failed with status: ${e.response!.statusCode}');
        log('Response body: ${e.response!.data}');

        if (e.response!.statusCode == 400) {
          log('Bad Request: Please check your request parameters or body.');
        }

        return Future.value(e.response);
      } else {
        // Something else went wrong (e.g., no response)
        log('Error sending request: ${e.message}');
      }
    }

    return Future.value(response);
  }

  Future<dynamic> getDataWaybillWithoutParms(url, parms,
      BuildContext ctx) async {
    late Response response;

    Directory directory = await getTemporaryDirectory();
    final file = File('${directory.path}/waybill.pdf');

    final options =
    Options(followRedirects: false, responseType: ResponseType.bytes);
    if (g.Get
        .find<LoginController>()
        .isUserIntialized
        .value) {
      log('bbbbbbbbbvvvvvvvvvvvvvvvv');
      dio.options.headers['Authorization'] =
          'Bearer ' + g.Get
              .find<LoginController>()
              .user
              .token!;
    }

    try {
      log('execute1 ..............');
      response = await dio.get(url,
          queryParameters: parms, options: options).whenComplete(() {
        log('whenComplete execute................');
      }).catchError((e) {
        var snackBar = SnackBar(
          content: Text(
            LocaleKeys.noWaybillDocument.tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: Get
                  .find<LanguageController>()
                  .isArabic
                  ? 'ElMessiri'
                  : 'BalsamiqSans',
            ),
          ),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(ctx).showSnackBar(
          snackBar,
        );
        log('catchError execute................');
      });

      // log('response.data runtimeType =  ${response.data.runtimeType}');
      log('statusCode =  ${response.statusCode}');

      await file.writeAsBytes(response.data);
      await OpenFile.open(file.path);
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        log('Request failed with status: ${e.response!.statusCode}');
        log('Response body: ${e.response!.data}');

        if (e.response!.statusCode == 400) {
          log('Bad Request: Please check your request parameters or body.');
        }

        return Future.value(e.response);
      } else {
        // Something else went wrong (e.g., no response)
        log('Error sending request: ${e.message}');
      }
    }

    return Future.value(response);
  }

  Future<dynamic> postData(url, data, parameter) async {
    late Response response;

    if (g.Get.find<LoginController>().isUserIntialized.value) {
      dio.options.headers['Authorization'] =
          'Bearer ' + g.Get.find<LoginController>().user.token!;
    }

    try {
      response = await dio.post(url, data: data, queryParameters: parameter);

      log('runtimeType data  ${response.data.runtimeType}');
      log('statusCode ${response.statusCode}');
      log('url ${url}');
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        log('Request failed with status: ${e.response!.statusCode}');
        log('Response body: ${e.response!.data}');

        if (e.response!.statusCode == 400) {
          log('Bad Request: Please check your request parameters or body.');
        }

        return Future.value(e.response);
      } else {
        // Something else went wrong (e.g., no response)
        log('Error sending request: ${e.message}');
      }
    }

    return Future.value(response);
  }

  Future<dynamic> postDataLogin(url, data) async {
    late Response response;

    if (g.Get.find<LoginController>().isUserIntialized.value) {
      dio.options.headers['Authorization'] =
          'Bearer ' + g.Get.find<LoginController>().user.token!;
    }

    try {
      response = await dio.post(url, data: data);

      log('runtimeType data  ${response.data.runtimeType}');
      log('statusCode ${response.statusCode}');
      log('url ${url}');
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        log('Request failed with status: ${e.response!.statusCode}');
        log('Response body: ${e.response!.data}');

        if (e.response!.statusCode == 400) {
          log('Bad Request: Please check your request parameters or body.');
        }

        return Future.value(e.response);
      } else {
        // Something else went wrong (e.g., no response)
        log('Error sending request: ${e.message}');
      }
    }

    return Future.value(response);
  }

  Future<dynamic> postDataParms(url, data) async {
    late Response response;

    if (g.Get.find<LoginController>().isUserIntialized.value) {
      dio.options.headers['Authorization'] =
          'Bearer ' + g.Get.find<LoginController>().user.token!;
    }

    try {
      response = await dio.post(url, queryParameters: data);

      log('response data  = ${response.data}');
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        log('Request failed with status essssss : ${e.response!.statusCode}');
        log('Response body: ${e.response!.data}');

        if (e.response!.statusCode == 400) {
          log('Bad Request: Please check your request parameters or body.');
        }

        return Future.value(e.response);
      } else {
        // Something else went wrong (e.g., no response)
        log('Error sending request: ${e.message}');
      }
    }

    return Future.value(response);
  }

  Future<dynamic> patchData(url, data) async {
    late Response response;

    try {
      response = await dio.patch(url, data: data);
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        log('Request failed with status: ${e.response!.statusCode}');
        log('Response body: ${e.response!.data}');

        if (e.response!.statusCode == 400) {
          log('Bad Request: Please check your request parameters or body.');
        }

        return Future.value(e.response);
      } else {
        // Something else went wrong (e.g., no response)
        log('Error sending request: ${e.message}');
      }
    }

    return Future.value(response);
  }

  Future<dynamic> putData(url, data) async {
    late Response response;

    try {
      response = await dio.put(url, data: data);
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        log('Request failed with status: ${e.response!.statusCode}');
        log('Response body: ${e.response!.data}');

        if (e.response!.statusCode == 400) {
          log('Bad Request: Please check your request parameters or body.');
        }

        return Future.value(e.response);
      } else {
        // Something else went wrong (e.g., no response)
        log('Error sending request: ${e.message}');
      }
    }

    return Future.value(response);
  }

  Future<dynamic> deleteData(url, data) async {
    late Response response;

    try {
      log('kkkkkkkkkkkkkkkkkkkkkkkkk');
      log('kkkkkkkkkkkkkkkkkkkkkkkkk');
      log('kkkkkkkkkkkkkkkkkkkkkkkkk');
      log('kkkkkkkkkkkkkkkkkkkkkkkkk');
      response = await dio.delete(url, data: data);
      if (response.statusCode == 200) {
        log('wwwwwwwwwwwwwwwwwwwwwwwww');
      } else {
        log('ssssssssssssssssssssssssss');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        log('Request failed with status: ${e.response!.statusCode}');
        log('Response body: ${e.response!.data}');

        if (e.response!.statusCode == 400) {
          log('Bad Request: Please check your request parameters or body.');
        }

        return Future.value(e.response);
      } else {
        // Something else went wrong (e.g., no response)
        log('Error sending request: ${e.message}');
      }
    }

    return Future.value(response);
  }

  Map<String, String> getTokenHeader(String token) => {
    'Authorization': 'Bearer $token',
  };

  void updateBaseUrl(String url) {
    dio.options.baseUrl = url;
  }

  void updateToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }
}
