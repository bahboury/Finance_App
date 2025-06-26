import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem({
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
      child: Center(
        child: Column(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffECF1F6),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(iconData, size: 20.sp, color: AppColors.primaryColor),
            ),
            const SizedBox(height: 12),
            Text(title, style: AppStyling.black15BoldStyle),
            const SizedBox(height: 8),
            Text(description, style: AppStyling.gey12MediumStyle),
          ],
        ),
      ),
    );
  }
}
