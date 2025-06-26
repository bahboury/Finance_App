import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:finance_app/core/widgets/custom_text_field.dart';
import 'package:finance_app/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 22.w),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28.h),
                Text(
                  'Forgot Password?',
                  style: AppStyling.primaryHeadLineStyle,
                ),
                SizedBox(height: 10.h),
                Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: AppStyling.secondaryHeadLineStyle,
                ),
                SizedBox(height: 32.h),
                CustomTextField(
                  hintText: "Enter your email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 38.h),
                PrimaryButtonWidget(
                  buttonText: "Send Code",
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      GoRouter.of(context).pushNamed(
                        AppRoutes.verifyOtpScreen,
                        extra: _emailController.text,
                      );
                    }
                  },
                ),
                SizedBox(height: 24.h),
                _buildRememberPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRememberPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Remember Password?",
          style: TextStyle(color: AppColors.secondaryColor),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRoutes.loginScreen);
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
