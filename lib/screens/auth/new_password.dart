import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:finance_app/core/widgets/custom_text_field.dart';
import 'package:finance_app/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28.h),
              Text(
                "Create New Password",
                style: AppStyling.primaryHeadLineStyle,
              ),
              SizedBox(height: 10.h),
              Text(
                "Please create a new password to secure your account",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                hintText: "Enter your password",
                controller: _passwordController,
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                hintText: "Confirm your password",
                controller: _confirmPasswordController,
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 38.h),
              PrimaryButtonWidget(
                buttonText: "Reset Password",
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    GoRouter.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.passSuccessfully);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
