import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_ass/service/api_service/model/newsModel.dart';

import 'package:news_app_ass/ui/core/extension/extension.dart';
import 'package:news_app_ass/ui/core/extension/widget_extensions.dart';
import 'package:news_app_ass/ui/core/reusableWidget/customText.dart';
import 'package:news_app_ass/ui/core/reusableWidget/custom_field.dart';
import 'package:news_app_ass/ui/core/theme/colors.dart';
import 'package:news_app_ass/ui/views/article/article_.dart';
import 'package:news_app_ass/ui/views/article/article_update.dart';
import 'package:news_app_ass/ui/views/article/filter_modal.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 32,
                  width: MediaQuery.of(context).size.width * 0.76,
                  child: ResusableField(
                    color: AppColors.textColor,
                    focusColor: AppColors.textColor,
                    hintText: 'Search',
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.textColor,
                      size: 16.sp,
                    ),
                  ),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.notification_add_outlined,
                    color: AppColors.white,
                    size: 14.sp,
                  ),
                ).appTouchable(() {}),
              ],
            ),
            20.0.h.spacingH,
            Row(
              children: [
                CustomText(
                  text: 'Latest News',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  fontColor: Colors.black,
                ),
                const Spacer(),
                Row(
                  children: [
                    CustomText(
                      text: 'See all',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.primary,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 14.sp,
                      color: AppColors.primary,
                    )
                  ],
                ),
              ],
            ),
            20.0.h.spacingH,
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  decoration: const BoxDecoration(),
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/latest.png',
                    height: 240.0.h,
                    fit: BoxFit.fitWidth,
                  ).appTouchable(() {}),
                ),
              ),
              Positioned(
                top: 40.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 23.0.w, vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: 'by Ryan Browne',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        fontColor: AppColors.white,
                      ),
                      5.h.spacingH,
                      CustomText(
                        text:
                            'Crypto investors should be\nprepared to lose all their money,\nBOE governor says',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontColor: AppColors.white,
                        textAlign: TextAlign.start,
                      ),
                      40.0.h.spacingH,
                      CustomText(
                        text:
                            '“I’m going to say this very bluntly again,” he added.\n“Buy them only if you’re prepared to lose all your money.”',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        fontColor: AppColors.white,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            20.0.h.spacingH,
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < viewModel.menu.length; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: viewModel.currentIndex == i
                                ? AppColors.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: viewModel.currentIndex == i
                                    ? Colors.transparent
                                    : AppColors.textColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: viewModel.menu[i],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            fontColor: viewModel.currentIndex == i
                                ? AppColors.white
                                : const Color(0XFF2E0505),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ).appTouchable(() {
                        viewModel.setIndex(i);
                      }),
                    ),
                ],
              ),
            ),
            20.0.h.spacingH,
            viewModel.currentIndex == 0
                ? viewModel.isBusy
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 28.0),
                        child: const CircularProgressIndicator(),
                      ))
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 1.7,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              List<Articles> articleslist = viewModel
                                  .newsModel!.articles!
                                  .take(5)
                                  .toList();
                              return Padding(
                                padding: EdgeInsets.only(bottom: 30.0.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 350,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.r),
                                              topRight: Radius.circular(10.r)),
                                          child: articleslist[index]
                                                      .urlToImage ==
                                                  null
                                              ? Image.asset('images/logo.png')
                                              : CachedNetworkImage(
                                                  fit: BoxFit.fitWidth,
                                                  imageUrl: articleslist[index]
                                                          .urlToImage ??
                                                      '',
                                                  placeholder: (context, url) =>
                                                      const CircularProgressIndicator(),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.r),
                                              bottomRight:
                                                  Radius.circular(10.r)),
                                          color: Colors.grey,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text:
                                                    articleslist[index].title ??
                                                        '',
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                fontColor: AppColors.white,
                                                textAlign: TextAlign.start,
                                              ),
                                              10.0.h.spacingH,
                                              CustomText(
                                                text: articleslist[index]
                                                        .content ??
                                                    '',
                                                fontSize: 14.sp,
                                                maxLine: 3,
                                                fontWeight: FontWeight.w700,
                                                fontColor: AppColors.white,
                                                textAlign: TextAlign.start,
                                              ),
                                              10.0.h.spacingH,
                                              Row(
                                                children: [
                                                  CustomText(
                                                    text:
                                                        'Author : ${articleslist[index].author ?? ''}',
                                                    fontSize: 12.sp,
                                                    maxLine: 3,
                                                    fontWeight: FontWeight.w700,
                                                    fontColor:
                                                        Color(0XFF2E0505),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ],
                                              ),
                                              10.0.h.spacingH,
                                              CustomText(
                                                text:
                                                    'Published AT : ${articleslist[index].publishedAt ?? ''}',
                                                fontSize: 12.sp,
                                                maxLine: 3,
                                                fontWeight: FontWeight.w700,
                                                fontColor: Color(0XFF2E0505),
                                                textAlign: TextAlign.start,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).appTouchable(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ArticleDetails(
                                                articles: articleslist[index],
                                              )));
                                }),
                              );
                            }),
                      )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: CustomText(
                        text: 'No News Available',
                        fontSize: 24.0,
                      ),
                    ),
                  ),
          ],
        ),
      ))),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
  @override
  Future<void> onViewModelReady(HomeViewModel viewModel) async {
    viewModel.getNews();
    super.onViewModelReady(viewModel);
  }
}
