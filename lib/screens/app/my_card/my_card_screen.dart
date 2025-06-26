import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/core/styling/app_styling.dart';
import 'package:finance_app/screens/app/my_card/widgets/my_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyCardScreen extends StatefulWidget {
  const MyCardScreen({super.key});

  @override
  State<MyCardScreen> createState() => _MyCardScreenState();
}

class _MyCardScreenState extends State<MyCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pushNamed(AppRoutes.appScreen),
        ),
        title: Text('My Card', style: AppStyling.black18BoldStyle),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            MyCardItem(
              color: Color(0xff617AFD),
              cardName: 'X-',
              cardBalance: '234000',
              cardNumber: '3434',
            ),
            SizedBox(height: 24.h),
            MyCardItem(
              color: Color(0xff4151A6),
              cardName: 'X-',
              cardBalance: '234000',
              cardNumber: '3434',
            ),
            // Card actions
            SizedBox(height: 10.h),
            _buildActionButton(Icons.credit_card, 'Card Details'),
            _buildActionButton(Icons.history, 'Transaction History'),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: ListTile(
        leading: Icon(icon, size: 24.w),
        title: Text(text, style: TextStyle(fontSize: 16.sp)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.w),
        onTap: () {},
      ),
    );
  }
}
