import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app_ass/main.dart';
import 'package:news_app_ass/ui/views/authentication/log_in/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:news_app_ass/app/app.locator.dart';
import 'package:news_app_ass/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
    Future<void> _showWelcomeNotification() async {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'welcome_notification_channel',
        'Welcome Notifications',
        channelDescription: 'This channel is for welcome notifications',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false,
      );
      NotificationDetails platformChannelSpecifics =
          const NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
        0,
        'Welcome to News App',
        'We are glad to have you here!',
        platformChannelSpecifics,
        payload: 'item x',
      );
    }

    void _navigateToSignUp() {
      _navigationService.navigateToWelcomePage();
    }

    void _navigateToLogin() {
      _navigationService.navigateToLoginPage();
    }

    Future<void> handleStartUp() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isFirstOpen = prefs.getBool('isFirstOpen') ?? true;

      if (isFirstOpen) {
        await _showWelcomeNotification();
        await prefs.setBool('isFirstOpen', false);
        _navigateToSignUp();
      } else {
        _navigateToLogin();
      }
    }
  }




class StartModel extends BaseViewModel {
  
}