import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app_ass/ui/core/extension/extension.dart';
import 'package:news_app_ass/ui/core/extension/widget_extensions.dart';
import 'package:news_app_ass/ui/core/reusableWidget/customText.dart';
import 'package:news_app_ass/ui/core/theme/colors.dart';
import 'package:news_app_ass/ui/views/article/article_model.dart';
import 'package:news_app_ass/ui/views/authentication/log_in/login_model.dart';
import 'package:stacked/stacked.dart';

class ArticleUpdate extends StatelessWidget {
  const ArticleUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllArticleMModel>.reactive(
        viewModelBuilder: () => AllArticleMModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: AppColors.backgroundColor,
              title: CustomText(
                text: 'Hot Updates',
                fontColor: AppColors.activeRed,
                fontSize: 16.sp,
              ),
              leading: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20.sp,
              ).appTouchable(() {
                Navigator.pop(context);
              }),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'images/update.png',
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        )),
                    10.0.h.spacingH,
                    CustomText(
                      text: 'Monday, 10th May,2021',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      fontColor: const Color(0XFF2E0505),
                    ),
                    20.0.h.spacingH,
                    CustomText(
                      text:
                          'WHO classifies triple-mutant Covid variant from\nIndia as global health risk',
                      fontSize: 14.sp,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w600,
                      fontColor: const Color(0XFF2E0505),
                    ),
                    10.0.h.spacingH,
                    RichText(
                      text: TextSpan(
                          text:
                              'A World Health Organization official said Monday it is reclassifying the highly contagious triple-mutant Covid variant spreading in India as a “variant of concern,” indicating that it’s become a...',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 15.sp),
                          children: [
                            TextSpan(
                                text: 'Read More',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize: 15.sp,
                                        color: AppColors.primary))
                          ]),
                    ),
                    15.0.h.spacingH,
                    CustomText(
                      text: 'Published by Berkeley Lovelace Jr.',
                      fontSize: 12.sp,
                      fontColor: const Color(0XFF2E0505),
                    ),
                    20.0.h.spacingH,
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'images/update1.png',
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        )),
                    10.0.h.spacingH,
                    CustomText(
                      text: 'Monday, 10th May,2021',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      fontColor: const Color(0XFF2E0505),
                    ),
                    20.0.h.spacingH,
                    CustomText(
                      text:
                          'What to do if you\'re planning or attending a wedding during the pandemic',
                      fontSize: 14.sp,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w600,
                      fontColor: const Color(0XFF2E0505),
                    ),
                    10.0.h.spacingH,
                    RichText(
                      text: TextSpan(
                          text:
                              'They had the artsy, rustic venue, the tailored dress and a guest list including about 150 of their closest friends and family. But the pandemic had other plans, forcing Carly Chalmers and Mitchell Gauvin to make a difficult decision about their wedding...',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 15.sp),
                          children: [
                            TextSpan(
                                text: 'Read More',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize: 15.sp,
                                        color: AppColors.primary))
                          ]),
                    ),
                    15.0.h.spacingH,
                    CustomText(
                      text: 'Published by Berkeley Lovelace Jr.',
                      fontSize: 12.sp,
                      fontColor: const Color(0XFF2E0505),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
