// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:news_app/authentication/create_new_password.dart';
// import 'package:news_app/core/extension/extension.dart';
// import 'package:news_app/core/extension/widget_extensions.dart';
// import 'package:news_app/core/reusableWidget/customText.dart';
// import 'package:news_app/core/reusableWidget/navbutton.dart';
// import 'package:news_app/core/theme/colors.dart';

// import 'package:flutter/gestures.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_field_style.dart';
// import 'package:otp_text_field/style.dart';

// class OtpPage extends StatefulWidget {
//   const OtpPage({super.key});

//   @override
//   State<OtpPage> createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> {
//   final OtpFieldController controller = OtpFieldController();
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 20.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 41.h,
//               width: 41.w,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12.r),
//                   border: Border.all(color: const Color(0XFFE8ECF4))),
//               child: Center(
//                   child: Icon(
//                 Icons.arrow_back_ios_sharp,
//                 size: 20.sp,
//                 color: const Color(0XFF1E232C),
//               )),
//             ).appTouchable(() {
//               Navigator.pop(context);
//             }),
//             25.0.h.spacingH,
//             CustomText(
//               text: 'OTP Verification',
//               fontSize: 28.0.sp,
//               fontWeight: FontWeight.w700,
//             ),
//             12.h.spacingH,
//             CustomText(
//               text:
//                   'Enter the verification code we just sent on your email address.',
//               fontSize: 15.0.sp,
//               fontWeight: FontWeight.w500,
//               fontColor: Color(0XFF8391A1),
//             ),
//             30.h.spacingH,
//             Center(
//               child: Container(
//                 width: MediaQuery.sizeOf(context).width * 0.9,
//                 child: OTPTextField(
//                   controller: controller,
//                   keyboardType: TextInputType.number,
//                   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                         // color: AppColors.primary,
//                         fontSize: 25,
//                       ),
//                   fieldWidth: 70.w,
//                   fieldStyle: FieldStyle.box,
//                   otpFieldStyle: OtpFieldStyle(
//                     borderColor:AppColors.gray,
//                     // enabledBorderColor: AppColors.primary.,
//                     disabledBorderColor: Colors.black,
//                     backgroundColor: AppColors.white,
//                     focusBorderColor: AppColors.primary,
//                   ),
//                   onChanged: (value) {
//                     validatePincode(value);
//                   },
//                   length: 4,
//                   contentPadding: const EdgeInsets.symmetric(vertical: 10),
//                 ),
//               ),
//             ),
//             30.0.h.spacingH,
//             NavButton(
//               text: 'Verify',
//               radius: 8.r,
//               labelColor: Colors.white,
//               color: const Color(0XFF1E232C),
//               borderColor: Colors.transparent,
//             ).appTouchable(() {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CreateNewPassword()));
//             }),
//             const Spacer(),
//                   Center(
//                     child: RichText(
//                       text: TextSpan(
//                           text: 'Didn’t received code? ',
//                           style:
//                               Theme.of(context).textTheme.bodySmall!.copyWith(
//                                     fontSize: 15.0.sp,
//                                     fontWeight: FontWeight.w500,
//                                     fontFamily: 'Urbanist',
//                                   ),
//                           children: [
//                             TextSpan(
//                               text: ' Resend',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall!
//                                   .copyWith(
//                                       fontSize: 15.0.sp,
//                                       fontWeight: FontWeight.w700,
//                                       fontFamily: 'Urbanist',
//                                       color: AppColors.primary),
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   // Navigator.push(
//                                   //     context,
//                                   //     MaterialPageRoute(
//                                   //         builder: (context) =>
//                                   //             const LoginPage()));
//                                 },
//                             )
//                           ]),
//                     ),
//                   ),
//                   10.0.spacingH
//           ],
//         ),
//       )),
//     );
//   }

//   bool pincode = false;
//   String pin = '';
//   void validatePincode(String code) {
//     setState(() {
//       pincode = code.length < 4 ? false : true;
//       pin = code;
//     });
//   }
// }
