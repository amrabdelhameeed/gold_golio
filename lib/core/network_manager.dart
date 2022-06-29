import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gold_golio/core/constants.dart';
import 'package:http_parser/http_parser.dart';

class NetworkManager {
  static Dio? dio;
  static init() async {
    dio = Dio(BaseOptions(baseUrl: baseURL, headers: {
      "Content-Type": "application/json",
    }));
  }

  static Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    init();
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Connection': 'keep-alive'
    };
    return await dio!.post(endPoint, data: data);
  }

  static Future<Response> patchData(
      {required String endPoint,
      required String token,
      required File file}) async {
    init();
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      'photo': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: MediaType("image", "jpeg"),
      ),
    });
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
      'Authorization': "Bearer $token"
    };
    return await dio!.patch(endPoint, data: formData);
  }

  static Future<Response> patchDataEditUser({
    required String endPoint,
    required String token,
    required String name,
    required String email,
  }) async {
    init();
    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
    });
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
      'Authorization': "Bearer $token"
    };
    return await dio!.patch(endPoint, data: formData);
  }

  // static Future<Response> postData({
  //   required String endPoint,
  //   required Map<String, dynamic> data,
  // }) async {
  //   init();
  //   dio!.options.headers = {
  //     'Content-Type': 'application/json',
  //     'Connection': 'keep-alive'
  //   };
  //   return await dio!.post(endPoint, data: data);
  // }

  static Future<Response> getData({
    required String endPoint,
    required String token,
    required Map<String, dynamic> query,
  }) async {
    init();
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
      'Authorization': "Bearer $token"
    };
    return await dio!.get(
      endPoint,
    );
  }
}



/* 
import 'package:dio/dio.dart';

class NetworkManager {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://cleaning.3m-erp.com/khadamaty/api/",
        headers: {
          "Content-Type": "application/json",
          "lang": "ar",
        }));
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    return dio!.post(url, queryParameters: query, data: data);
  }
}*/