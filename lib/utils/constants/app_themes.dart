import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes{

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldlight,
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonlightmode)
      ),

      textTheme: const TextTheme(
          bodySmall: TextStyle(color: AppColors.textlightmode),
          bodyLarge: TextStyle(color: AppColors.textlightmode))

  );


  static final ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.scaffolddark,
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttondarkmode
          )
      ),
      textTheme: const TextTheme(
          bodySmall: TextStyle(color: AppColors.textdarkmode),
          bodyLarge: TextStyle(color: AppColors.textdarkmode)
      )
  );
}