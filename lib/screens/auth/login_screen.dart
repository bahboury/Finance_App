import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:finance_app/core/widgets/custom_text_field.dart';
import 'package:finance_app/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Welcome back!\nAgain!',
                    style: AppStyling.primaryHeadLineStyle,
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    hintText: "Enter your email",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    hintText: "Enter your password",
                    controller: _passwordController,
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRoutes.forgetPassScreen);
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: AppColors.secondaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  PrimaryButtonWidget(
                    buttonText: "Login",
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        // Login logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing login...')),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 24.h),
                  _buildDividerWithText(),
                  SizedBox(height: 24.h),
                  _buildSocialLoginButtons(),
                  SizedBox(height: 24.h),
                  _buildRegisterNowText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDividerWithText() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Text(
            'Or Login with',
            style: TextStyle(color: AppColors.secondaryColor),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
      ],
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(icon: Icons.facebook, color: Colors.blue),
        _buildSocialButton(icon: Icons.g_mobiledata, color: Colors.red),
        _buildSocialButton(icon: Icons.apple, color: Colors.black),
      ],
    );
  }

  Widget _buildSocialButton({required IconData icon, required Color color}) {
    return InkWell(
      onTap: () {
        // Handle social login
      },
      child: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(child: Icon(icon, color: color, size: 30.sp)),
      ),
    );
  }

  Widget _buildRegisterNowText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: AppColors.secondaryColor),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRoutes.registerScreen);
          },
          child: Text(
            "Register Now",
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
