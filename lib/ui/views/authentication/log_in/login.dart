import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/gestures.dart';
import 'package:news_app_ass/ui/core/extension/extension.dart';
import 'package:news_app_ass/ui/core/extension/widget_extensions.dart';
import 'package:news_app_ass/ui/core/reusableWidget/customText.dart';
import 'package:news_app_ass/ui/core/reusableWidget/custom_field.dart';
import 'package:news_app_ass/ui/core/reusableWidget/navbutton.dart';
import 'package:news_app_ass/ui/core/theme/colors.dart';
import 'package:news_app_ass/ui/views/authentication/log_in/login_model.dart';
import 'package:news_app_ass/ui/views/authentication/sign_up/signup.dart';
import 'package:news_app_ass/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginModel>.reactive(
        onViewModelReady: (viewModel) async {},
        viewModelBuilder: () => LoginModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 22.w),
                child: CustomScrollView(slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 41.h,
                            width: 41.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border:
                                    Border.all(color: const Color(0XFFE8ECF4))),
                            child: Center(
                                child: Icon(
                              Icons.arrow_back_ios_sharp,
                              size: 20.sp,
                              color: const Color(0XFF1E232C),
                            )),
                          ).appTouchable(() {
                            Navigator.pop(context);
                          }),
                          30.0.h.spacingH,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 78.h,
                                width: 280.w,
                                child: CustomText(
                                  text: 'Welcome back! Glad to see you, Again!',
                                  fontSize: 28.0.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              30.h.spacingH,
                              ResusableField(
                                validator: (String? value) =>
                                    viewModel.validateEmail(value),
                                hintText: 'Enter your email',
                                controller: viewModel.emailControllers,
                              ),
                              15.0.h.spacingH,
                              ResusableField(
                                obscuringText: viewModel.isVisibility,
                                validator: (String? value) =>
                                    viewModel.validatePassword(value),
                                controller: viewModel.passwordControllers,
                                hintText: 'Enter your password',
                                suffixIcon: Icon(
                                  viewModel.isVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0XFF6A707C),
                                ).appTouchable(() {
                                  viewModel.setVisibility();
                                }),
                                onChanged: (val) {},
                              ),
                              15.0.h.spacingH,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text: 'Forgot Password?',
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w600,
                                    fontColor: const Color(0XFF6A707C),
                                  ).appTouchable(() {}),
                                ],
                              ),
                              30.0.h.spacingH,
                              viewModel.isBusy
                                  ? Center(
                                      child: const CircularProgressIndicator(
                                        color: AppColors.primary,
                                      ),
                                    )
                                  : NavButton(
                                      text: 'Login',
                                      radius: 8.r,
                                      labelColor: Colors.white,
                                      color: const Color(0XFF1E232C),
                                      borderColor: Colors.transparent,
                                    ).appTouchable(() {
                                      if (viewModel.formKey.currentState!
                                          .validate()) {
                                        viewModel.logIn(
                                            viewModel.emailControllers.text,
                                            viewModel.passwordControllers.text,
                                            context);
                                      }
                                    }),
                            ],
                          ),
                          30.0.h.spacingH,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 100.w, child: const Divider()),
                              Text(
                                '  Or Login With  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF6A707C)),
                              ),
                              SizedBox(width: 100.w, child: const Divider()),
                            ],
                          ),
                          22.0.h.spacingH,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < viewModel.media.length; i++)
                                  Container(
                                    height: 50.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                          color: const Color(0XFFE8ECF4),
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: SvgPicture.asset(
                                        viewModel.media[i],
                                      ),
                                    ),
                                  ),
                              ]),
                          const Spacer(),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'Don’t have an account?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 15.0.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Urbanist',
                                      ),
                                  children: [
                                    TextSpan(
                                      text: ' Register Now',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontSize: 15.0.sp,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Urbanist',
                                              color: AppColors.primary),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpPage()));
                                        },
                                    )
                                  ]),
                            ),
                          ),
                          10.0.spacingH
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
