import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_ass/ui/core/extension/extension.dart';
import 'package:news_app_ass/ui/core/extension/widget_extensions.dart';
import 'package:news_app_ass/ui/core/reusableWidget/customText.dart';
import 'package:news_app_ass/ui/core/reusableWidget/navbutton.dart';
import 'package:news_app_ass/ui/views/authentication/log_in/login.dart';
import 'package:news_app_ass/ui/views/authentication/sign_up/signup.dart';
import 'package:news_app_ass/ui/views/authentication/welcomeModel.dart';
import 'package:stacked/stacked.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeModel>.reactive(
      onViewModelReady: (viewModel) async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          
          viewModel.showDialog();
        });
      },
      viewModelBuilder: () => WelcomeModel(),
      builder: (context, viewModel, child) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/welcome.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('images/logo.png'),
                    CustomText(
                      text: 'News App',
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0.h,
                      fontColor: const Color(0XFF1E232C),
                    ),
                    40.0.h.spacingH,
                    NavButton(
                      text: 'Login',
                      radius: 8.r,
                      labelColor: Colors.white,
                      color: const Color(0XFF1E232C),
                      borderColor: Colors.transparent,
                    ).appTouchable(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }),
                    15.0.h.spacingH,
                    NavButton(
                      text: 'Register',
                      radius: 8.r,
                      color: Colors.transparent,
                      borderColor: const Color(0XFF1E232C),
                    ).appTouchable(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    }),
                    45.0.h.spacingH,
                    CustomText(
                      text: 'Continue as a guest',
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0.h,
                      fontColor: const Color(0XFF35C2C1),
                    ).appTouchable(() {})
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
