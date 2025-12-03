import 'package:flutter/material.dart';

import '../../utils/extensions/context_extensions.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final bool disabled;
  final TextStyle? textStyle;
  final double? width;
  final Color? bgColor;
  final double? height;
  final bool isLoading;
  final VoidCallback onTap;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.disabled = false,
    this.bgColor,
    this.width,
    this.icon,
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
        // height: 58,
        height: height ?? 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: disabled
                ? context.colors.disabled
                : context.colors.primaryColor,
            width: 3,
          ),
          color: bgColor ?? context.colors.backgroundColor,
          // gradient: accentGradient,
          boxShadow: disabled ? null : [
            BoxShadow(
              color: context.colors.grey300.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
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
                            color: disabled
                                ? context.colors.disabled
                                : context.colors.primaryColor,
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
                        color: disabled
                            ? context.colors.disabled
                            : context.colors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
        ),
      ),
    );
  }
}
