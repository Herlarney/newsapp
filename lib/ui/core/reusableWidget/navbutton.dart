
import 'package:flutter/material.dart';
import 'package:news_app_ass/ui/core/theme/colors.dart';

class NavButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? radius;
  final double? height;
  final Color? labelColor;
  final Color? borderColor;
  const NavButton({
    this.height,
    this.borderColor,
    this.radius,
    this.color,
    this.labelColor,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??50,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? AppColors.primary),
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(radius ?? 12)),
      child: Center(
        child: Text(
          text!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              color: labelColor ?? Colors.black),
        ),
      ),
    );
  }
}
