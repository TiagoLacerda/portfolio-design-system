import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

import 'portfolio_colors.dart';

abstract final class PortfolioTheme {
  static final ThemeData light = _construct(
    Brightness.light,
    PortfolioColors.light,
  );

  static final ThemeData dark = _construct(
    Brightness.dark,
    PortfolioColors.dark,
  );

  static ThemeData _construct(
    Brightness brightness,
    PortfolioColors portfolioColors,
  ) {
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: portfolioColors.primary,
      onPrimary: portfolioColors.onPrimary,
      secondary: portfolioColors.primary,
      onSecondary: portfolioColors.text,
      error: portfolioColors.error,
      onError: portfolioColors.text,
      surface: portfolioColors.surface,
      onSurface: portfolioColors.text,
      surfaceContainer: portfolioColors.surface,
      surfaceContainerHigh: portfolioColors.surfaceHigh,
    );

    final typography = Typography.material2021();

    final textTheme = GoogleFonts.interTextTheme(
      typography.englishLike
          .merge(typography.black)
          .apply(
            displayColor: portfolioColors.text,
            bodyColor: portfolioColors.text,
            decorationColor: portfolioColors.text,
          ),
    );

    final themeData = ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
      useMaterial3: true,
    );

    return themeData.copyWith(
      extensions: [
        portfolioColors,
      ],
      scaffoldBackgroundColor: portfolioColors.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: portfolioColors.surface,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black,
      ),
      cardTheme: CardThemeData(
        color: portfolioColors.surface,
      ),
      dividerTheme: DividerThemeData(
        color: portfolioColors.text,
        space: 0.0,
        thickness: 0.5,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: portfolioColors.surface,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          iconSize: 32.0,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          splashFactory: NoSplash.splashFactory,
          // foregroundColor: colorScheme.primary,
        ),
      ),
    );
  }
}
