
import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String? text;
  final textAlign;
  // final style;
  final fontSize;
  final fontWeight;
  final fontColor;
  final maxLine;
  final overFlow;
  const CustomText({
    required this.text,
    this.maxLine,
    this.overFlow,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.textAlign,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overFlow ?? TextOverflow.ellipsis,
      maxLines: maxLine ?? 5,
      text!,
      textAlign: textAlign ?? TextAlign.start,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: fontSize ?? 16.0,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontFamily: 'Urbanist',
          color: fontColor ?? Color(0XFF1E232C)),
    );
  }
}
