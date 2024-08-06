import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app_ass/service/api_service/error/error_util.dart';
import 'package:stacked_services/stacked_services.dart';

class FlushBarService{
  Future <void> showFlushError ({required String title}) async{
   await Flushbar(
      backgroundColor: const Color(0XFFB3261E),
      duration: const Duration(seconds: 4),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: true,
      icon: SvgPicture.asset( 
          'images/error.svg'
      ),
      title: 'Error',
      message:title,
    ).show(StackedService.navigatorKey!.currentContext!);
  }

  Future<void> showFlushError2(Object e) async {
    final error = DioErrorUtil.handleError(e);
    await Flushbar(
      backgroundColor: const Color(0XFFB3261E),
      duration: const Duration(seconds: 4),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: true,
      icon: SvgPicture.asset('images/error.svg'),
      title: 'Error',
      message: error,
    ).show(StackedService.navigatorKey!.currentContext!);
  }

  Future <void>  showFlushSuccess({required String title}) async {
   await  Flushbar(
      backgroundColor: const Color(0XFF12B76A),
      duration: const Duration(milliseconds: 100),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: true,
      icon: SvgPicture.asset(
       'images/succes.svg'
      ),
      title: 'Success',
      message:title,
    ).show(StackedService.navigatorKey!.currentContext!);
  }
}