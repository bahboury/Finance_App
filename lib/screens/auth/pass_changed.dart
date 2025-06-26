import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:finance_app/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PassChanged extends StatelessWidget {
  const PassChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success checkmark icon
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Badge background with scalloped edge
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                    // Checkmark icon
                    Icon(Icons.check, color: Colors.white, size: 50.sp),
                  ],
                ),
              ),
              SizedBox(height: 35.h),
              // Password changed text
              Text('Password Changed!', style: AppStyling.primaryHeadLineStyle),
              SizedBox(height: 8.h),
              // Success message
              Text(
                'Your password has been changed successfully.',
                textAlign: TextAlign.center,
                style: AppStyling.secondaryHeadLineStyle,
              ),
              SizedBox(height: 40.h),
              // Back to login button
              PrimaryButtonWidget(
                buttonText: 'Back to Login',
                onPress: () {
                  GoRouter.of(context).goNamed(AppRoutes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
