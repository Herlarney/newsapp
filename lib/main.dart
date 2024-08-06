import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_ass/app/app.bottomsheets.dart';
import 'package:news_app_ass/app/app.dialogs.dart';
import 'package:news_app_ass/app/app.locator.dart';
import 'package:news_app_ass/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('first_time_opened') ?? true;
  if (isFirstTime) {
    print('$isFirstTime');
    await prefs.setBool('first_time_opened', false);
  }
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(MainApp(
    isFirstTime: isFirstTime,
  ));
}

class MainApp extends StatelessWidget {
  final bool isFirstTime;
  const MainApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: isFirstTime ? Routes.welcomePage : Routes.loginPage,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [
            StackedService.routeObserver,
          ],
        );
      },
    );
  }
}
