import 'package:news_app_ass/app/app.bottomsheets.dart';
import 'package:news_app_ass/app/app.dialogs.dart';
import 'package:news_app_ass/app/app.locator.dart';
import 'package:news_app_ass/service/api_service/api.dart';
import 'package:news_app_ass/service/api_service/model/newsModel.dart';
import 'package:news_app_ass/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  
  final _bottomSheetService = locator<BottomSheetService>();

 List<String> menu = ['Global', 'Technology', 'Finance', 'Arts', 'Sport'];
  List<String> sortings = [
    'Recommended',
    'Latest',
    'Most Viewed',
    'Channel',
    'Following'
  ];
  List<String> frame = [
    'images/Frame1.png',
    'images/Frame.png',
  ];
  int currentIndex = 0;
  void setIndex (int i){
    currentIndex =i;
    notifyListeners();
  }

    
   final _authApi = locator<AuthApi>();
  NewsModel? newsModel;
  
    Future<NewsModel> getNews() async {
    final result =
        await runBusyFuture(_authApi.getNews(),);
    newsModel = result;
   
  
    return result;
  }
}
