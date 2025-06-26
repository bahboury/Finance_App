import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:finance_app/core/widgets/custom_text_field.dart';
import 'package:finance_app/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
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
          icon: Container(
            width: 41,
            height: 41,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Center(
              child: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
            ),
          ),
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
                    'Hello! Register to get started',
                    style: AppStyling.primaryHeadLineStyle,
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    hintText: "Enter your username",
                    controller: _usernameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15.h),
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
                  SizedBox(height: 30.h),
                  PrimaryButtonWidget(
                    buttonText: "Register",
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        // Registration logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Processing registration...'),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 24.h),
                  _buildDividerWithText(),
                  SizedBox(height: 24.h),
                  _buildSocialLoginButtons(),
                  SizedBox(height: 24.h),
                  _buildLoginNowText(),
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
            'Or Register with',
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
        // Handle social registration
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

  Widget _buildLoginNowText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(color: AppColors.secondaryColor),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRoutes.loginScreen);
          },
          child: Text(
            "Login Now",
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
