import 'package:dio/dio.dart';

String ksBaseUrl = "https://jollof.tatspace.com/api/v1";
String KsSignUp = "auth/sign-up";
String KsLogin = "auth/sign-in";

class BaseApi {
  var dio = Dio();
  String baseUrl = ksBaseUrl;
  Options defaultOptions = Options(
    sendTimeout: Duration(seconds: 20), // 20 seconds
    receiveTimeout: Duration(seconds: 20), // 20 seconds
    validateStatus: (s) => s! < 500,
  );
}
