import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/extensions/context_extensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final Color? filledColor;
  final Color? textColor;
  final FocusNode? focusNode;
  final double? fontSize;
  final String hintText;
  final double? hintFontSize;
  final Color? borderColor;
  final Color? hintColor;
  final Color? cursorColor;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  final bool? obscureText;
  final bool? showCursor;
  final EdgeInsets? contentPadding;
  final Widget? prefix;
  final double? leftprefixPadding;
  final double? rightprefixPadding;
  final List<TextInputFormatter>? fieldFormatters;
  final bool? enableCopy;

  const CustomTextField({
    super.key,
    this.showCursor,
    required this.controller,
    this.inputType,
    this.filledColor,
    this.cursorColor,
    this.focusNode,
    this.fontSize,
    required this.hintText,
    this.hintFontSize,
    this.borderColor,
    this.hintColor,
    this.readOnly = false,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.prefix,
    this.validator,
    this.onChanged,
    this.obscureText,
    this.textColor,
    this.contentPadding,
    this.fieldFormatters,
    this.enableCopy,
    this.leftprefixPadding,
    this.rightprefixPadding,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      readOnly: readOnly,
      obscureText: obscureText ?? false,
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      showCursor: showCursor ?? true,
      focusNode: focusNode,
      keyboardType: inputType ?? TextInputType.text,
      cursorColor:
          cursorColor ?? theme.colorScheme.tertiary.withValues(alpha: 0.5),
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      style: Theme.of(
        context,
      ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,
      color: readOnly ? context.colors.disabled : context.colors.textBlack900),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(
                  left: leftprefixPadding ?? 16.0,
                  right: rightprefixPadding ?? 8.0,
                  top: 4.0,
                  bottom: 4.0,
                ),
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                child: suffixIcon,
              )
            : null,
        filled: true,
        fillColor: readOnly && onTap == null ? context.colors.disabled100 : context.colors.surfaceColor,
        hintText: hintText,
        errorMaxLines: 2,
        errorStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
          color: context.colors.error,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: context.colors.error, width: 2),
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: Theme.of(
            context,
          ).textTheme.bodyMedium?.color!.withValues(alpha: 0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
        prefix: prefix,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      inputFormatters: fieldFormatters,
      enableInteractiveSelection: enableCopy,
    );
  }
}

