// ignore_for_file: deprecated_member_use

import 'package:finance_app/core/styling/app_assets.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardItem extends StatelessWidget {
  const MyCardItem({
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
    return Container(
      width: 327.w,
      height: 179.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background elements
          Positioned(
            top: 62,
            right: 129,
            child: Image.asset(
              AppAssets.layer1,
              width: 277.w,
              height: 277.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 124,
            right: 191,
            child: Image.asset(
              AppAssets.layer2,
              width: 153.w,
              height: 153.h,
              fit: BoxFit.cover,
            ),
          ),
          // Card content
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card type
                Text(
                  '$cardName Card'.toUpperCase(),
                  style: AppStyling.black18BoldStyle.copyWith(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.8),
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 24.h),
                // Card number
                Text(
                  '•••• •••• •••• $cardNumber',
                  style: AppStyling.black18BoldStyle.copyWith(
                    fontSize: 16.sp,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                Spacer(),
                // Bottom row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Balance
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Balance',
                          style: AppStyling.black18BoldStyle.copyWith(
                            fontSize: 12.sp,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '$cardBalance EG',
                          style: AppStyling.black18BoldStyle.copyWith(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    // Expiry
                    Text(
                      '12/24',
                      style: AppStyling.black18BoldStyle.copyWith(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
