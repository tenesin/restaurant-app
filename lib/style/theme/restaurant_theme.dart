import 'package:flutter/material.dart';
import '../colors/restaurant_colors.dart';
import '../typography/restaurant_text_styles.dart';

class RestaurantTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: RestaurantColors.blue.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      cardTheme: _cardTheme,
      inputDecorationTheme: _inputDecorationTheme,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: RestaurantColors.blue.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarThemeDark,
      elevatedButtonTheme: _elevatedButtonTheme,
      cardTheme: _cardThemeDark,
      inputDecorationTheme: _inputDecorationThemeDark,
      scaffoldBackgroundColor: Colors.black,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: RestaurantTextStyles.displayLarge,
      displayMedium: RestaurantTextStyles.displayMedium,
      displaySmall: RestaurantTextStyles.displaySmall,
      headlineLarge: RestaurantTextStyles.headlineLarge,
      headlineMedium: RestaurantTextStyles.headlineMedium,
      headlineSmall: RestaurantTextStyles.headlineSmall,
      titleLarge: RestaurantTextStyles.titleLarge,
      titleMedium: RestaurantTextStyles.titleMedium,
      titleSmall: RestaurantTextStyles.titleSmall,
      bodyLarge: RestaurantTextStyles.bodyLargeBold,
      bodyMedium: RestaurantTextStyles.bodyLargeMedium,
      bodySmall: RestaurantTextStyles.bodyLargeRegular,
      labelLarge: RestaurantTextStyles.labelLarge,
      labelMedium: RestaurantTextStyles.labelMedium,
      labelSmall: RestaurantTextStyles.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      toolbarTextStyle: _textTheme.titleLarge,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
    );
  }

  static AppBarTheme get _appBarThemeDark {
    return AppBarTheme(
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white,
      toolbarTextStyle: _textTheme.titleLarge,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
    );
  }

  static final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: RestaurantColors.blue.color,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  static const CardTheme _cardTheme = CardTheme(
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  static const CardTheme _cardThemeDark = CardTheme(
    color: Color(0xFF1E1E1E),
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: RestaurantColors.blue.color, width: 2),
    ),
    labelStyle: const TextStyle(color: Colors.black54),
  );

  static final InputDecorationTheme _inputDecorationThemeDark = InputDecorationTheme(
    filled: true,
    fillColor: Colors.black26,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white30),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: RestaurantColors.blue.color, width: 2),
    ),
    labelStyle: const TextStyle(color: Colors.white70),
  );
}
