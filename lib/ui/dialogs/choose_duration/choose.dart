import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app_ass/ui/core/extension/widget_extensions.dart';
import 'package:news_app_ass/ui/core/reusableWidget/customText.dart';
import 'package:news_app_ass/ui/core/theme/colors.dart';
import 'package:news_app_ass/ui/dialogs/choose_duration/choose_model.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChooseDurationDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ChooseDurationDialog(
      {required this.request, required this.completer, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseWalletModel>.reactive(
      viewModelBuilder: () => ChooseWalletModel(),
      builder: (context, viewModel, child) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          child: Container(
            height: 350.h,
            width: 390.w,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  50.0.h.spacingH,
                  Image.asset('images/logo.png'),
                  30.0.h.spacingH,
                  CustomText(
                    text: 'Welcome to TrAce News App',
                    textAlign: TextAlign.center,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  20.0.h.spacingH,
                  CustomText(
                    text: 'Bringing the World to Your Fingertips!',
                    textAlign: TextAlign.center,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColors.primary,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      completer(
                        DialogResponse(
                          confirmed: true,
                        ),
                      );
                    },
                    child: Container(
                      height: 53,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.primary),
                      child: Center(
                        child: Text(
                          'Continue',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(),
                        ),
                      ),
                    ),
                  ),
                  10.0.h.spacingH,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
