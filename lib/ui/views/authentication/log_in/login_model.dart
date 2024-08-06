import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app_ass/app/app.locator.dart';
import 'package:news_app_ass/service/api_service/api.dart';
import 'package:news_app_ass/service/api_service/model/loginModel.dart';
import 'package:news_app_ass/service/flushBar_service/flushBar.dart';
import 'package:news_app_ass/ui/views/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

String globalEmail = '';
String globalName = '';

class LoginModel extends BaseViewModel {
  List<String> media = [
    'images/facebook.svg',
    'images/google.svg',
    'images/apple.svg'
  ];
  String? validateEmail(String? value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (!emailRegex.hasMatch(value!)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a PIN';
    }

    return null;
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController emailControllers = TextEditingController();
  TextEditingController passwordControllers = TextEditingController();
  final _flushBarService = locator<FlushBarService>();
  final _authApi = locator<AuthApi>();
  LogInRes? login;
  Future<LogInRes?> logIn(
      String email, String pin, BuildContext context) async {
    try {
      final result = await runBusyFuture(_authApi.logIn(email, pin));
      if (result.statusCode == 200) {
        String id = result.data.user.id;
        globalEmail = emailControllers.text;
        globalName =
            "${result.data.user.lastname} ${result.data.user.firstname} ";

        await saveEmail(emailControllers.text);

        log('this is the user id : $id');
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomeView()));

        await Future.delayed(const Duration(seconds: 1));
      } else {
        await _flushBarService.showFlushError(title: result.message);
      }
      login = result;
      return result;
    } catch (e) {
      await _flushBarService.showFlushError(
          title: '[Auth failed]: Invalid credentials');
    }
  }

  bool isVisibility = false;
  void setVisibility() {
    isVisibility == false ? isVisibility = true : isVisibility = false;
    notifyListeners();
  }
}

Future<void> saveEmail(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
}
