import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.description,
  });
  final IconData iconData;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE3E9ED), width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffECF1F6),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(iconData, size: 20.sp, color: AppColors.primaryColor),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: AppStyling.black15BoldStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: AppStyling.gey12MediumStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
