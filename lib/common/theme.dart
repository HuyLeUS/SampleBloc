import 'package:flutter/material.dart';
import 'package:sample_bloc/common/colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
    );
  }
}
