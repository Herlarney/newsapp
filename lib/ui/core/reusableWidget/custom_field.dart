
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  final String? hint;
  final suffixIcon;
  final onChanged;
  final obscuringCharacter;
  final bool? obscuring;
  const CustomField({
    this.obscuringCharacter,
    this.hint,
    this.suffixIcon,
    this.obscuring,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextFormField(
        onChanged: onChanged,
        obscureText: obscuring ?? false,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: const Color(0XFF7A7A7A),
              fontSize: 14,
              fontWeight: FontWeight.w500),
          filled: true,
          fillColor: const Color(0XFFF6F7F9),
          suffixIcon: suffixIcon,
          suffixIconColor: const Color(0XFF7A7A7A),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFF6F7F9)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFF6F7F9)),
          ),
        ),
      ),
    );
  }
}

class ResusableField extends StatelessWidget {
  final String? Function(String?)? validator;
  final hintText;
  final onChanged;
  final labelStyle;
  final String? errorText;
  final bool? obscuringText;
  final EdgeInsets? contentpadding;
  final obscuringCharacter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final controller;
  final labelText;
  final cursorColor;
  final int? maxLines;
  final int maxLength;
  final Color? fillColor;
  final textAlign;
  final textInputType;
  final color;
  final focusColor;
  final radius;
  final focusNode;
  final suffixIconColor;
  final void Function()? onTap;
  final InputBorder? focusBorder;
  final InputBorder? enableBorder;
  final TextInputType? keyBoardType;
  final hintstyle;
  final style;
  final double? width;
  final height;
  final bool? filled;
  final bool? autoFocus;
  final prefixIconColor;
  final bool? enable;

  const ResusableField({
    this.errorText,
    this.enable,
    this.radius,
    this.prefixIconColor,
    this.autoFocus,
    this.filled,
    this.cursorColor,
    this.keyBoardType,
    this.style,
    this.suffixIconColor,
    this.focusBorder,
    this.focusNode,
    this.validator,
    this.focusColor,
    this.labelStyle,
    this.hintstyle,
    this.onTap,
    this.enableBorder,
    this.fillColor,
    this.onChanged,
    this.height,
    this.obscuringText,
    this.color,
    this.suffixIcon,
    this.contentpadding,
    this.controller,
    this.hintText,
    this.labelText,
    this.maxLines,
    this.maxLength = -1,
    this.obscuringCharacter,
    this.prefixIcon,
    this.textAlign,
    this.textInputType,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        enabled: enable,
        style: style ?? Theme.of(context).textTheme.bodyLarge!,
        cursorColor: cursorColor ?? Colors.black.withOpacity(0.4),
        focusNode: focusNode,
        onTap: onTap,
        onChanged: onChanged,
        obscureText: obscuringText ?? false,
        textAlign: textAlign ?? TextAlign.start,
        validator: validator,
        keyboardType: keyBoardType ?? TextInputType.text,
        controller: controller,
        maxLines: maxLines ?? 1,
        // maxLength: maxLength,
        decoration: InputDecoration(
            errorText: errorText,
            filled: filled ?? true,
            label: labelText,
            labelStyle: labelStyle,
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: radius ?? BorderRadius.circular(8)),
            contentPadding:
                contentpadding ?? const EdgeInsets.only(top: 20, left: 10),
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: hintstyle ??
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color(0XFF8391A1),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Urbanist'),
            prefixIcon: prefixIcon,
            prefixIconColor: prefixIconColor ?? const Color(0XFF7A7A7A),
            suffixIconColor: suffixIconColor ?? const Color(0XFFF6F7F9),
            fillColor: fillColor ?? const Color(0XFFF7F8F9),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: BorderSide(
                  color: focusColor ?? Color(0XFFE8ECF4),
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: const BorderSide(
                  color: Color(0XFFE8ECF4),
                ))),
      ),
    );
  }
}
