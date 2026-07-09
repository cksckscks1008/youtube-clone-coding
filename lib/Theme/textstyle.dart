import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static const TextStyle _base = TextStyle(
    color: AppColors.textPrimary,
    fontFamily: 'Pretendard',
  );

  static final TextStyle titleLarge = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle titleMedium = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle body = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle caption = _base.copyWith(
    fontSize: 12,
    color: Colors.grey,
  );
}