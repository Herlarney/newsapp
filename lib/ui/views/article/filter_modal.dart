import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app_ass/ui/core/extension/extension.dart';
import 'package:news_app_ass/ui/core/extension/widget_extensions.dart';
import 'package:news_app_ass/ui/core/reusableWidget/customText.dart';
import 'package:news_app_ass/ui/core/reusableWidget/navbutton.dart';
import 'package:news_app_ass/ui/core/theme/colors.dart';

class ArticleFilterSheet extends StatelessWidget {
  const ArticleFilterSheet({
    super.key,
    required this.sortings,
  });

  final List<String> sortings;

  @override
  Widget build(BuildContext context) {
    return
    
     Container(
      height: MediaQuery.of(context).size.height * .42,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                10.0.h.spacingH,
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 4.h,
                        width: 60.w,
                        child: const Divider(
                          thickness: 4,
                        )),
                  ],
                ),
                10.0.h.spacingH,
                Row(
                  children: [
                    const CustomText(
                      text: 'Filter',
                      fontWeight: FontWeight.w800,
                      fontColor: AppColors.black,
                    ),
                    const Spacer(),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(
                                    0XFF2E0505)),
                            borderRadius:
                                BorderRadius.circular(
                                    20.r)),
                        child: Padding(
                          padding:
                              const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons
                                    .delete_outline_outlined,
                                size: 14.sp,
                              ),
                              CustomText(
                                text: ' Reset',
                                fontWeight:
                                    FontWeight.w600,
                                fontColor:
                                    AppColors.textColor,
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                        )).appTouchable(() {
                      Navigator.pop(context);
                    }),
                  ],
                ),
                20.0.h.spacingH,
                CustomText(
                  text: 'Sort By',
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.black,
                  fontSize: 14.sp,
                ),
                10.0.h.spacingH,
                SizedBox(
                  height: 100.h,
                  child: GridView.builder(
                    shrinkWrap: true,
                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 100.w/35.h,
                              crossAxisCount: 3,
                              crossAxisSpacing: 6.w,
                              mainAxisSpacing: 6.h),
                              itemCount: sortings.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                  color: const Color(
                                      0XFF2E0505))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: sortings[index],fontSize: 14.sp,
                            ),
                          ),
                        );
                      }),
                ),
                const NavButton(
                  text: 'Apply',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
