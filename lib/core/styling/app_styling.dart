import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyling {
  static var primaryHeadLineStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );
  static var secondaryHeadLineStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.greyColor,
  );
  static var black16w500Style = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static var gey12MediumStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryColor,
  );
  static var black15BoldStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static var black18BoldStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
