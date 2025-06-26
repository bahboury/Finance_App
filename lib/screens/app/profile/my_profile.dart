import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/core/styling/app_assets.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:finance_app/screens/app/profile/widgets/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pushNamed(AppRoutes.appScreen),
        ),
        title: Text('My Profile', style: AppStyling.black18BoldStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            // Profile Picture and Name
            Center(
              child: Column(
                children: [
                  SizedBox(height: 39.h),
                  CircleAvatar(
                    radius: 60.r,
                    backgroundImage: AssetImage(
                      AppAssets.myImage,
                    ), // Use AssetImage for local images
                  ),
                  SizedBox(height: 16.h),
                  PersonalInfo(title: "Full Name", content: "Bahy Mohy"),
                  SizedBox(height: 16.h),
                  PersonalInfo(title: "Gmail", content: "bahymohy@gmail.com"),
                  SizedBox(height: 16.h),
                  PersonalInfo(title: "Phone", content: "+1 3712 3789"),
                  SizedBox(height: 16.h),
                  PersonalInfo(title: "Address", content: "Cairo,Egypt"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
