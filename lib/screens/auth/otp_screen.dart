import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:finance_app/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController pinCodeController;

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.only(left: 22.w),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
            ),
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(22),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28.h),
                SizedBox(
                  width: 280.w,
                  child: Text(
                    "OTP Verification",
                    style: AppStyling.primaryHeadLineStyle,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Enter the verification code we just sent on your email address.",
                  style: AppStyling.secondaryHeadLineStyle,
                ),
                SizedBox(height: 32.h),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: pinCodeController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldWidth: 70.w,
                    fieldHeight: 60.h,
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    selectedColor: AppColors.primaryColor,
                    activeColor: AppColors.blackColor,
                    inactiveColor: AppColors.greyColor,
                    selectedFillColor: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 38),
                PrimaryButtonWidget(
                  buttonText: "Verify",
                  onPress: () {
                    if (pinCodeController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter OTP code')),
                      );
                      return;
                    }
                    if (pinCodeController.text.length < 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter complete OTP code'),
                        ),
                      );
                      return;
                    }
                    GoRouter.of(context).pushNamed(AppRoutes.passSuccessfully);
                  },
                ),
                SizedBox(height: 24.h),
                _buildResendCodeText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResendCodeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Didn’t received code?",
          style: TextStyle(color: AppColors.secondaryColor),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            " Resend",
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
