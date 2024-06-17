import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

extension DioExtension on Dio {
  /// Common GET method.
  Future<Response?> getApi(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //get_package.Get.context!.loaderOverlay.show();
    Response? response;

    try {
      response = await get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioError catch (e) {
      _showErrorSnacbar(e);
    } finally {
      //// get_package.Get.context!.loaderOverlay.hide();
    }

    //_showErrorSnacbarWhenStatusCodeIs200(response);
    // _showErrorSnacbarWhenStatusCodeIs401(response);
    return response;
  }

  /// Common POST method.
  Future<Response?> postApi(
    String path, {
    dynamic body,
  }) async {
    // get_package.Get.context!.loaderOverlay.show();
    Response? response;

    try {
      response = await post(
        path,
        data: body,
      );
    } on DioError catch (e) {
      _showErrorSnacbar(e);
    } finally {
      //// get_package.Get.context!.loaderOverlay.hide();
    }

    // _showErrorSnacbarWhenStatusCodeIs200(response);
    //_showErrorSnacbarWhenStatusCodeIs401(response);
    return response;
  }

  /// Common MULTIPART POST method.
  Future<Response?> postMultipartApi(
    String path, {
    FormData? formData,
    void Function(int, int)? onSendProgress,
    Options? options,
  }) async {
    // get_package.Get.context!.loaderOverlay.show();
    Response? response;

    try {
      response = await post(
        path,
        options: options,
        data: formData,
        onSendProgress: onSendProgress,
      );
    } on DioError catch (e) {
      _showErrorSnacbar(e);
    } finally {
      // // get_package.Get.context!.loaderOverlay.hide();
    }

    // _showErrorSnacbarWhenStatusCodeIs200(response);
    //_showErrorSnacbarWhenStatusCodeIs401(response);
    return response;
  }

  /// Common MULTIPART PUT method.
  Future<Response?> putMultipartApi(
    String path, {
    FormData? formData,
  }) async {
    // get_package.Get.context!.loaderOverlay.show();
    Response? response;

    try {
      response = await put(
        path,
        data: formData,
      );
    } on DioError catch (e) {
      _showErrorSnacbar(e);
    } finally {
      // // get_package.Get.context!.loaderOverlay.hide();
    }

    //_showErrorSnacbarWhenStatusCodeIs200(response);
    //_showErrorSnacbarWhenStatusCodeIs401(response);
    return response;
  }

  void _showErrorSnacbar(DioError e) {
    debugPrint('This is error ===> $e');
    switch (e.type) {
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectionTimeout:
        // get_package.Get.snackbar(
        //   AppErrors.serverTimeoutError,
        //   AppErrors.serverTimeoutErrorDetails,
        // );
        break;

      case DioErrorType.unknown:
        if (e.error is SocketException) {
          // get_package.Get.snackbar(
          //   AppErrors.noInternet,
          //   AppErrors.noInternetDetails,
          // );
        }
        break;

      default:
        // get_package.Get.snackbar(
        //   AppErrors.errorOccurred,
        //   AppErrors.unknownErrorDetails,
        // );
        break;
    }
  }

  /// Handle Error when status code is 200.
  // void _showErrorSnacbarWhenStatusCodeIs200(Response? response) {
  //   if (response?.statusCode == 200) {
  //     final commonResponse = CommonApiResponse.fromJson(response?.data);
  //     if (commonResponse.status != true) {
  //       // customSnackBar(
  //       //   errorMessage:
  //       //       commonResponse.message ?? AppErrors.unknownErrorDetails,
  //       // );
  //     }
  //   }
  // }

  // void _showErrorSnacbarWhenStatusCodeIs401(Response? response) {
  //   if (response?.statusCode == 401) {
  //     final commonResponse = CommonApiResponse.fromJson(response?.data);
  //     if (commonResponse.status != true) {
  //       get_package.Get.toNamed(Routes.LOGIN);
  //       get_package.Get.snackbar(
  //         AppErrors.errorOccurred,
  //         commonResponse.message ?? AppErrors.unknownErrorDetails,
  //       );
  //     }
  //   }
  // }
}
