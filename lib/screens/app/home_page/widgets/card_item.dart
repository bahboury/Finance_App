import 'package:finance_app/core/styling/app_assets.dart';
import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.color,
    required this.cardName,
    required this.cardBalance,
    required this.cardNumber,
  });

  final Color color;
  final String cardName;
  final String cardNumber;
  final String cardBalance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 207.w,
          height: 263.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        Positioned(
          top: 62.h,
          right: 9.w,
          child: Image.asset(AppAssets.layer1, fit: BoxFit.fill),
        ),
        Positioned(
          top: 124.h,
          right: 71.w,
          child: Image.asset(AppAssets.layer2, fit: BoxFit.fill),
        ),
        Positioned(
          left: 24.w,
          top: 24.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$cardName Card",
                style: AppStyling.black18BoldStyle.copyWith(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 57),
              Text(
                "Balance",
                style: AppStyling.black18BoldStyle.copyWith(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "$cardBalance EG",
                style: AppStyling.black18BoldStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 26.h,
          right: 24.w,
          child: Text(
            "12/24",
            style: AppStyling.black18BoldStyle.copyWith(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 26.h,
          left: 24.w,
          child: Text(
            "****  $cardNumber",
            style: AppStyling.black18BoldStyle.copyWith(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
