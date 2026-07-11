import 'package:flutter/material.dart';

final class PortfolioColors extends ThemeExtension<PortfolioColors> {
  static const PortfolioColors light = PortfolioColors(
    text: Color(0xCC000000),
    primary: Color(0xFF2FB5B7),
    onPrimary: Color(0xFFF0F0F0),
    surface: Color(0xFFF0F0F0),
    surfaceHigh: Color(0xFFFFFFFF),
    error: Colors.redAccent,
  );

  static const PortfolioColors dark = PortfolioColors(
    text: Color(0xCCFFFFFF),
    primary: Color(0xFF0ED7DF),
    onPrimary: Color(0xCCFFFFFF),
    surface: Color(0xFF0F0F0F),
    surfaceHigh: Color(0xFF1F1F1F),
    error: Colors.redAccent,
  );

  final Color text;
  final Color primary;
  final Color onPrimary;
  final Color surface;
  final Color surfaceHigh;
  final Color error;

  const PortfolioColors({
    required this.text,
    required this.primary,
    required this.onPrimary,
    required this.surface,
    required this.surfaceHigh,
    required this.error,
  });

  @override
  PortfolioColors copyWith({
    Color? text,
    Color? primary,
    Color? onPrimary,
    Color? surface,
    Color? surfaceHigh,
    Color? error,
  }) {
    return PortfolioColors(
      text: text ?? this.text,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      surface: surface ?? this.surface,
      surfaceHigh: surfaceHigh ?? this.surfaceHigh,
      error: error ?? this.error,
    );
  }

  @override
  PortfolioColors lerp(
    PortfolioColors? other,
    double t,
  ) {
    if (other is! PortfolioColors) {
      return this;
    }
    return PortfolioColors(
      text: Color.lerp(text, other.text, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceHigh: Color.lerp(surfaceHigh, other.surfaceHigh, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }
}
