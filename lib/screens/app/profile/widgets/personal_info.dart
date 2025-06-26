import 'package:finance_app/core/styling/app_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337.w,
      height: 78.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyling.gey12MediumStyle.copyWith(fontSize: 14.sp),
          ),
          SizedBox(height: 16.h),
          Text(content, style: AppStyling.black16w500Style),
        ],
      ),
    );
  }
}
