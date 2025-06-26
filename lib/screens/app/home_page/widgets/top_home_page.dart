import 'package:finance_app/core/styling/app_assets.dart';
import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopHomePage extends StatefulWidget {
  const TopHomePage({super.key});

  @override
  State<TopHomePage> createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
              child: Image.asset(
                AppAssets.myImage,
                width: 48.w,
                height: 48.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 11),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back",
                  style: AppStyling.gey12MediumStyle.copyWith(
                    color: const Color(0xff6A707C),
                  ),
                ),
                const SizedBox(height: 2),
                Text("Bahy Mohy", style: AppStyling.black18BoldStyle),
              ],
            ),
          ],
        ),
        Container(
          width: 48.w,
          height: 48.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xffE3E9ED), width: 1),
          ),
          child: Icon(
            Icons.notifications,
            size: 24.sp,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
