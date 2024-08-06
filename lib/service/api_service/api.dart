import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_ass/app/app.locator.dart';
import 'package:news_app_ass/service/api_service/base_api.dart';
import 'package:news_app_ass/service/api_service/model/loginModel.dart';
import 'package:news_app_ass/service/api_service/model/newsModel.dart';
import 'package:news_app_ass/service/flushBar_service/flushBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApi extends BaseApi {
  final _flushBarService = locator<FlushBarService>();
  // SignUpResponse? signUpResponse;
// ......................SignUp...................
  Future<LogInRes> logIn(String email, String pin) async {
    final Map<String, String> data = {"email": email, "pin": pin};

    debugPrint(data.toString());
    try {
      final response = await Dio().post("$ksBaseUrl/$KsLogin", data: data);

      log(' data is ${response.data}');

      switch (response.statusCode) {
        case 201:
          return LogInRes.fromJson(response.data);

        case 400:
          return LogInRes.fromJson(response.data);

        default:
          throw "Error";
      }
    } on DioException catch (e) {
      debugPrint("Response failed");
      _flushBarService.showFlushError2(e.response?.data.message);
      return LogInRes.fromJson(e.response?.data);
    }
  }

  Future<NewsModel> getNews() async {
    try {
      final response = await Dio().get(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-07-06&sortBy=publishedAt&apiKey=a551350c819c48d9b9e0bf42f0e715f5",
      );

      log('${response.data} ');

      switch (response.statusCode) {
        case 200:
          return NewsModel.fromJson(response.data);
        default:
          throw 'Error in fetching response';
      }
    } on DioException catch (e) {
      debugPrint("Response failed");
      return NewsModel.fromJson(e.response?.data);
    }
  }
}
