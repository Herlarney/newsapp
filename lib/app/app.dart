import 'package:news_app_ass/service/api_service/api.dart';
import 'package:news_app_ass/service/flushBar_service/flushBar.dart';
import 'package:news_app_ass/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:news_app_ass/ui/dialogs/choose_duration/choose.dart';
import 'package:news_app_ass/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:news_app_ass/ui/views/article/article_.dart';
import 'package:news_app_ass/ui/views/article/article_update.dart';
import 'package:news_app_ass/ui/views/authentication/log_in/login.dart';
import 'package:news_app_ass/ui/views/authentication/sign_up/signup.dart';
import 'package:news_app_ass/ui/views/authentication/welcome.dart';
import 'package:news_app_ass/ui/views/home/home_view.dart';
import 'package:news_app_ass/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: SignUpPage),
    MaterialRoute(page: ArticleUpdate),
    MaterialRoute(page: ArticleDetails),
    MaterialRoute(page: WelcomePage),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
     LazySingleton(classType: FlushBarService),
    LazySingleton(classType: AuthApi),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
        StackedDialog(classType: ChooseDurationDialog),
    // @stacked-dialog
  ],
)
class App {}
