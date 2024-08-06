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
import 'package:news_app_ass/ui/views/authentication/log_in/login.dart';
import 'package:news_app_ass/ui/views/authentication/sign_up/signUp_Model.dart';
import 'package:stacked/stacked.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> media = [
      'images/facebook.svg',
      'images/google.svg',
      'images/apple.svg'
    ];
    return ViewModelBuilder<SignupModel>.reactive(
        viewModelBuilder: () => SignupModel(),
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
                        25.0.h.spacingH,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 78.h,
                              width: 280.w,
                              child: CustomText(
                                text: 'Hello! Register to get started',
                                fontSize: 28.0.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            25.h.spacingH,
                            const ResusableField(
                              hintText: 'Username',
                            ),
                            15.0.h.spacingH,
                            ResusableField(
                              hintText: 'Email',
                              onChanged: (val) {},
                            ),
                            15.0.h.spacingH,
                            ResusableField(
                              hintText: 'Password',
                              onChanged: (val) {},
                            ),
                            15.0.h.spacingH,
                            ResusableField(
                              hintText: 'Confirm Password',
                              onChanged: (val) {},
                            ),
                            30.0.h.spacingH,
                            NavButton(
                              text: 'Register',
                              radius: 8.r,
                              labelColor: Colors.white,
                              color: const Color(0XFF1E232C),
                              borderColor: Colors.transparent,
                            ).appTouchable(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            }),
                          ],
                        ),
                        30.0.h.spacingH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 97.w, child: const Divider()),
                            Text(
                              '  Or Register With  ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0XFF6A707C)),
                            ),
                            SizedBox(width: 97.w, child: const Divider()),
                          ],
                        ),
                        22.0.h.spacingH,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < media.length; i++)
                                Container(
                                  height: 50.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: const Color(0XFFE8ECF4),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: SvgPicture.asset(
                                      media[i],
                                    ),
                                  ),
                                ),
                            ]),
                        const Spacer(),
                        Center(
                          child: RichText(
                            text: TextSpan(
                                text: 'Already have an account?',
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
                                    text: ' Login Now',
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
                                                    LoginPage()));
                                      },
                                  )
                                ]),
                          ),
                        ),
                        10.0.spacingH
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
