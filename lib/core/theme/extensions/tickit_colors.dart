import 'package:flutter/material.dart';

@immutable
class TickItColors extends ThemeExtension<TickItColors> {
  final Color primaryColor;
  final Color onPrimaryColor;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
  final Color surfaceContainerLow;
  final Color surfaceContainerLowest;

  /// Accent Colors
  final Color secondary;
  final Color secondaryContainer;
  final Color accentColor200;
  final Color accentColor300;
  final Color accentColor400;

  /// Other Colors
  final Color success;
  final Color success100;
  final Color warning;
  final Color warning100;
  final Color error;
  final Color error100;
  final Color info;
  final Color info100;
  final Color disabled;
  final Color disabled100;
  final Color selected;
  final Color selected100;

  /// Secondary Colors

  final Color backgroundColor;
  final Color surfaceColor;

  /// Text Colors
  final Color textBlack900;
  final Color textBlack800;
  final Color textBlack700;
  final Color textBlack600;

  /// Interface Colors
  final Color grey10;
  final Color grey50;
  final Color grey100;
  final Color grey200;
  final Color grey300;
  final Color grey400;
  final Color grey500;
  final Color grey600;
  final Color grey700;
  final Color grey800;
  final Color iconColor;

  const TickItColors({
    required this.primaryColor,
    required this.onPrimaryColor,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.surfaceContainerLow,
    required this.surfaceContainerLowest,
    required this.secondary,
    required this.secondaryContainer,
    required this.accentColor200,
    required this.accentColor300,
    required this.accentColor400,
    required this.success,
    required this.success100,
    required this.error,
    required this.error100,
    required this.warning,
    required this.warning100,
    required this.info,
    required this.info100,
    required this.disabled,
    required this.disabled100,
    required this.selected,
    required this.selected100,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.textBlack900,
    required this.textBlack800,
    required this.textBlack700,
    required this.textBlack600,
    required this.grey10,
    required this.grey50,
    required this.grey100,
    required this.grey200,
    required this.grey300,
    required this.grey400,
    required this.grey500,
    required this.grey600,
    required this.grey700,
    required this.grey800,
    required this.iconColor,
  });

  @override
  ThemeExtension<TickItColors> copyWith({
    Color? primaryColor,
    Color? onPrimaryColor,
    Color? primaryColor100,
    Color? primaryColor200,
    Color? primaryColor300,
    Color? primaryColor400,
    Color? primaryColor500,
    Color? accentColor,
    Color? accentColor100,
    Color? accentColor200,
    Color? accentColor300,
    Color? accentColor400,
    Color? surfaceContainer,
    Color? secondary,
    Color? secondaryContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? surfaceContainerLow,
    Color? surfaceContainerLowest,
    Color? success,
    Color? success100,
    Color? error,
    Color? error100,
    Color? warning,
    Color? warning100,
    Color? info,
    Color? info100,
    Color? selected,
    Color? selected100,
    Color? disabled,
    Color? disabled100,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? textBlack900,
    Color? textBlack800,
    Color? textBlack700,
    Color? textBlack600,
    Color? grey10,
    Color? grey50,
    Color? grey100,
    Color? grey200,
    Color? grey300,
    Color? grey400,
    Color? grey500,
    Color? grey600,
    Color? grey700,
    Color? grey800,
    Color? iconColor,
  }) {
    return TickItColors(
      primaryColor: primaryColor ?? this.primaryColor,
      onPrimaryColor: onPrimaryColor ?? this.onPrimaryColor,
      surfaceContainer: primaryColor100 ?? this.surfaceContainer,
      surfaceContainerHigh: primaryColor200 ?? this.surfaceContainerHigh,
      surfaceContainerHighest: primaryColor300 ?? this.surfaceContainerHighest,
      surfaceContainerLow: primaryColor400 ?? this.surfaceContainerLow,
      surfaceContainerLowest: primaryColor500 ?? this.surfaceContainerLowest,
      secondary: accentColor ?? this.secondary,
      secondaryContainer: accentColor100 ?? this.secondaryContainer,
      accentColor200: accentColor200 ?? this.accentColor200,
      accentColor300: accentColor300 ?? this.accentColor300,
      accentColor400: accentColor400 ?? this.accentColor400,
      success: success ?? this.success,
      success100: success100 ?? this.success100,
      warning: warning ?? this.warning,
      warning100: warning100 ?? this.warning100,
      error: error ?? this.error,
      error100: error100 ?? this.error100,
      info: info ?? this.info,
      info100: info100 ?? this.info100,
      selected: selected ?? this.selected,
      selected100: selected100 ?? this.selected100,
      disabled: disabled ?? this.disabled,
      disabled100: disabled100 ?? this.disabled100,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      textBlack900: textBlack900 ?? this.textBlack900,
      textBlack800: textBlack800 ?? this.textBlack800,
      textBlack700: textBlack700 ?? this.textBlack700,
      textBlack600: textBlack600 ?? this.textBlack600,
      grey10: grey10 ?? this.grey10,
      grey50: grey50 ?? this.grey50,
      grey100: grey100 ?? this.grey100,
      grey200: grey200 ?? this.grey200,
      grey300: grey300 ?? this.grey300,
      grey400: grey400 ?? this.grey400,
      grey500: grey500 ?? this.grey500,
      grey600: grey600 ?? this.grey600,
      grey700: grey700 ?? this.grey700,
      grey800: grey800 ?? this.grey800,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  ThemeExtension<TickItColors> lerp(
    covariant ThemeExtension<TickItColors>? other,
    double t,
  ) {
    if (other is! TickItColors) return this;

    return TickItColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      onPrimaryColor: Color.lerp(onPrimaryColor, other.onPrimaryColor, t)!,
      surfaceContainer: Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
      surfaceContainerHigh: Color.lerp(surfaceContainerHigh, other.surfaceContainerHigh, t)!,
      surfaceContainerHighest: Color.lerp(surfaceContainerHighest, other.surfaceContainerHighest, t)!,
      surfaceContainerLow: Color.lerp(surfaceContainerLow, other.surfaceContainerLow, t)!,
      surfaceContainerLowest: Color.lerp(surfaceContainerLowest, other.surfaceContainerLowest, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryContainer: Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      accentColor200: Color.lerp(accentColor200, other.accentColor200, t)!,
      accentColor300: Color.lerp(accentColor300, other.accentColor300, t)!,
      accentColor400: Color.lerp(accentColor400, other.accentColor400, t)!,
      success: Color.lerp(success, other.success, t)!,
      success100: Color.lerp(success100, other.success100, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warning100: Color.lerp(warning100, other.warning100, t)!,
      error: Color.lerp(error, other.error, t)!,
      error100: Color.lerp(error100, other.error100, t)!,
      info: Color.lerp(info, other.info, t)!,
      info100: Color.lerp(info100, other.info100, t)!,
      selected: Color.lerp(selected, other.selected, t)!,
      selected100: Color.lerp(selected100, other.selected100, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      disabled100: Color.lerp(disabled100, other.disabled100, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      textBlack900: Color.lerp(textBlack900, other.textBlack900, t)!,
      textBlack800: Color.lerp(textBlack800, other.textBlack800, t)!,
      textBlack700: Color.lerp(textBlack700, other.textBlack700, t)!,
      textBlack600: Color.lerp(textBlack600, other.textBlack600, t)!,
      grey10: Color.lerp(grey10, other.grey10, t)!,
      grey50: Color.lerp(grey50, other.grey50, t)!,
      grey100: Color.lerp(grey100, other.grey100, t)!,
      grey200: Color.lerp(grey200, other.grey200, t)!,
      grey300: Color.lerp(grey300, other.grey300, t)!,
      grey400: Color.lerp(grey400, other.grey400, t)!,
      grey500: Color.lerp(grey500, other.grey500, t)!,
      grey600: Color.lerp(grey600, other.grey600, t)!,
      grey700: Color.lerp(grey700, other.grey700, t)!,
      grey800: Color.lerp(grey800, other.grey800, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }

  factory TickItColors.fromScheme(ColorScheme scheme) {
    return TickItColors(
      primaryColor: scheme.primary,
      onPrimaryColor: scheme.onPrimary,
      surfaceContainer: scheme.surfaceContainer,
      surfaceContainerHigh: scheme.surfaceContainerHigh,
      surfaceContainerHighest: scheme.surfaceContainerHighest,
      surfaceContainerLow: scheme.surfaceContainerLow,
      surfaceContainerLowest: scheme.surfaceContainerLowest,

      secondary: scheme.secondary,
      secondaryContainer: scheme.secondaryContainer,

      accentColor200: scheme.tertiary,
      accentColor300: scheme.onSecondary,
      accentColor400: scheme.secondary,

      success: Colors.green,
      success100: Colors.green.shade50,
      warning: Colors.orange,
      warning100: Colors.orange.shade50,
      error: scheme.error,
      error100: scheme.errorContainer,
      info: scheme.tertiary,
      info100: scheme.tertiaryContainer,
      disabled: Colors.grey,
      disabled100: Colors.grey.shade300,
      selected: scheme.primaryContainer,
      selected100: scheme.surfaceVariant,

      backgroundColor: scheme.surfaceContainerLowest,
      surfaceColor: scheme.surfaceContainerLow,

      textBlack900: scheme.onSurface,
      textBlack800: scheme.onSurface,
      textBlack700: scheme.onSurface.withValues(alpha: 0.8),
      textBlack600: scheme.onSurface.withValues(alpha: 0.6),

      grey10: Colors.grey.shade50,
      grey50: Colors.grey.shade100,
      grey100: Colors.grey.shade200,
      grey200: Colors.grey.shade300,
      grey300: Colors.grey.shade400,
      grey400: Colors.grey.shade500,
      grey500: Colors.grey.shade600,
      grey600: Colors.grey.shade700,
      grey700: Colors.grey.shade800,
      grey800: Colors.grey.shade900,

      iconColor: scheme.secondary,
    );
  }



  /// Light Theme Colors
  static const light = TickItColors(
    /// Primary Colors
    primaryColor: Color(0xFF00CFFF),
    onPrimaryColor: Color(0xFFD0F6FF),
    surfaceContainer: Color(0xFFD0F6FF),
    surfaceContainerHigh: Color(0xFF9EEAFF),
    surfaceContainerHighest: Color(0xFF56D7FF),
    surfaceContainerLow: Color(0xFF00B1E6),
    surfaceContainerLowest: Color(0xFF00CFFF),

    /// Accent Colors
    secondary: Color(0xFFC85EFF),
    secondaryContainer: Color(0xFFF4DEFF),
    accentColor200: Color(0xFFD8A9FF),
    accentColor300: Color(0xFFB375E7),
    accentColor400: Color(0xFF9129C8),

    /// Other Colors
    success: Color(0xFF5CB88F),
    success100: Color(0xFFE6F4ED),
    warning: Color(0xFFF1AE52),
    warning100: Color(0xFFFFF3E0),
    error: Color(0xFFE96A6A),
    error100: Color(0xFFFDECEC),
    info: Color(0xFF4DAEDC),
    info100: Color(0xFFEAF6FC),
    disabled: Color(0xFFC5CBD3),
    disabled100: Color(0xFFF5F6F7),
    selected: Color(0xFF7A9DB2),
    selected100: Color(0xFFEDF3F7),

    backgroundColor: Color(0xFFF6F8FA),
    surfaceColor: Color(0xFFFFFFFF),
    // backgroundColor: Color(0xFFFFFFFF),
    // surfaceColor: Color(0xFFF6F8F9),

    /// Text Colors
    textBlack900: Color(0xFF1A1A1A),
    textBlack800: Color(0xFF5E5E5E),
    textBlack700: Color(0xFF999999),
    textBlack600: Color(0xFF999999),

    /// GREYS
    grey10: Color(0xFFF7F9FA),
    grey50: Color(0xFFF9FAFB),
    grey100: Color(0xFFF1F5F9),
    grey200: Color(0xFFE5EAF0),
    grey300: Color(0xFFD1D5DB),
    grey400: Color(0xFF9CA3AF),
    grey500: Color(0xFF6B7280),
    grey600: Color(0xFF4B5563),
    grey700: Color(0xFF374151),
    grey800: Color(0xFF1F2937),

    /// Icon Colors
    iconColor: Color(0xFF5F6F7A),
  );

  /// Dark Theme Colors
  static const dark = TickItColors(
    /// Primary Colors
    primaryColor: Color(0xFF219ebc),
    onPrimaryColor: Color(0xFFD0F6FF),
    surfaceContainer: Color(0xFF395F70),
    surfaceContainerHigh: Color(0xFF3E6E82),
    surfaceContainerHighest: Color(0xFF508DA7),
    surfaceContainerLow: Color(0xFF61A2BA),
    surfaceContainerLowest: Color(0xFF4A8BAC),

    /// Accent Colors
    secondary: Color(0xFFF76C5E),
    secondaryContainer: Color(0xFFFFE3DC),
    accentColor200: Color(0xFFFFBFAF),
    accentColor300: Color(0xFFFF998C),
    accentColor400: Color(0xFFF76C5E),

    /// Other Colors
    success: Color(0xFF61D4A1),
    success100: Color(0xFF1E3B32),
    warning: Color(0xFFFFBB55),
    warning100: Color(0xFF3F2D14),
    error: Color(0xFFF27878),
    error100: Color(0xFF3A2020),
    info: Color(0xFF5AC4ED),
    info100: Color(0xFF1C303C),
    disabled: Color(0xFF47525E),
    disabled100: Color(0xFF262A32),
    selected: Color(0xFFA1C0D2),
    selected100: Color(0xFF2B3942),

    backgroundColor: Color(0xFF181A1E),
    surfaceColor: Color(0xFF0E0F11),

    /// Text Colors
    textBlack900: Color(0xFFF1F1F1),
    textBlack800: Color(0xFFA9A9A9),
    textBlack700: Color(0xFF666666),
    textBlack600: Color(0xFF666666),

    /// GREYS
    grey10: Color(0xFF1C1F26),
    grey50: Color(0xFF2A2E36),
    grey100: Color(0xFF333841),
    grey200: Color(0xFF3C4049),
    grey300: Color(0xFF4B515B),
    grey400: Color(0xFF636973),
    grey500: Color(0xFF7C848F),
    grey600: Color(0xFFA1AAB5),
    grey700: Color(0xFFD1D5DB),
    grey800: Color(0xFFE4E7EB),

    /// Icon Colors
    iconColor: Color(0xFFD1D5DB),
  );
}
