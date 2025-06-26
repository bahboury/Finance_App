// ignore_for_file: file_names

import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/core/styling/app_assets.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:finance_app/core/widgets/primary_button_widget.dart';
import 'package:finance_app/core/widgets/primary_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppAssets.logo,
            height: 570.h,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 21),
          PrimaryButtonWidget(
            buttonText: "Login",
            onPress: () {
              GoRouter.of(context).pushNamed(AppRoutes.loginScreen);
            },
          ),
          SizedBox(height: 15),
          PrimaryOutlinedButton(
            buttonText: "Register",
            onPress: () {
              GoRouter.of(context).pushNamed(AppRoutes.registerScreen);
            },
          ),
          SizedBox(height: 36),
          TextButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoutes.appScreen);
            },
            child: Text(
              "continue as a guest",
              style: AppStyling.black15BoldStyle.copyWith(
                color: Color(0xff202955),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
