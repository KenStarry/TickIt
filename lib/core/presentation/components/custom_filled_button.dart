import 'package:flutter/material.dart';

import '../../utils/extensions/context_extensions.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final bool showElevation;
  final LinearGradient? gradient;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final bool isLoading;
  final VoidCallback onTap;

  const CustomFilledButton({
    super.key,
    required this.text,
    this.bgColor,
    this.textColor,
    this.isLoading = false,
    this.showElevation = true,
    this.gradient,
    this.borderRadius,
    this.icon,
    this.width,
    this.height,
    this.textStyle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 55,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(100),
          color: bgColor ?? context.colors.primaryColor
          // gradient: (gradient ?? context.decorations.btnGradient),
          // boxShadow: showElevation ? context.decorations.btnShadow : null
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
            color: context.colors.onPrimaryColor,
          )
              : icon != null
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: [
                    icon!,
                    Text(
                      text,
                      style:
                          textStyle ??
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: textColor ?? context.colors.onPrimaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                )
              : Text(
                  text,
                  style:
                      textStyle ??
                      Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: textColor ?? context.colors.onPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
        ),
      ),
    );
  }
}
