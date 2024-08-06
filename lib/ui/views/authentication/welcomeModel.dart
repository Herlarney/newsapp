import 'package:news_app_ass/app/app.dialogs.dart';
import 'package:news_app_ass/service/api_service/api.dart';
import 'package:news_app_ass/service/api_service/model/newsModel.dart';
import 'package:news_app_ass/service/flushBar_service/flushBar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class WelcomeModel extends BaseViewModel {
   
  final _dialogService = locator<DialogService>();
    void showDialog() async{
    var result = await _dialogService.showCustomDialog(
      variant: DialogType.chooseDuration,
      title: 'Welcome to Our News App!',
    );
    print("Dialog result: $result");
  }



 
  
} 