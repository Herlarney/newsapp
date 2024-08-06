import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_ass/service/api_service/model/newsModel.dart';

import 'package:news_app_ass/ui/core/extension/extension.dart';
import 'package:news_app_ass/ui/core/extension/widget_extensions.dart';
import 'package:news_app_ass/ui/core/reusableWidget/customText.dart';
import 'package:news_app_ass/ui/core/theme/colors.dart';
import 'package:news_app_ass/ui/views/article/article_model.dart';
import 'package:stacked/stacked.dart';

class ArticleDetails extends StatelessWidget {
  final Articles articles;
  ArticleDetails({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllArticleMModel>.reactive(
        viewModelBuilder: () => AllArticleMModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: 200,

                    child: articles.urlToImage == null
                        ? Image.asset('images/logo.png')
                        : CachedNetworkImage(
                          fit: BoxFit.fitHeight,
                          width: double.infinity,
                          imageUrl: articles.urlToImage ?? '',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: articles.title,
                          textAlign: TextAlign.start,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.black,
                        ),
                        10.0.h.spacingH,
                        CustomText(
                          text:
                              articles.content,
                          textAlign: TextAlign.start,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontColor: const Color(0XFF2E0505),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
