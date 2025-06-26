import 'package:finance_app/screens/app/home_page/widgets/carousel_widget.dart';
import 'package:finance_app/screens/app/home_page/widgets/home_page_item.dart';
import 'package:finance_app/screens/app/home_page/widgets/top_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 18.h),
          TopHomePage(),
          SizedBox(height: 18.h),
          CarouselWidget(),
          SizedBox(height: 24.h),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.sp,
                crossAxisSpacing: 16.sp,
              ),
              children: [
                HomePageItem(
                  title: "Send Money",
                  description: "Take acc to acc",
                  iconData: Icons.send,
                ),
                HomePageItem(
                  title: "Pay the bill",
                  description: "Lorem ipsum",
                  iconData: Icons.wallet,
                ),
                HomePageItem(
                  title: "Request",
                  description: "Lorem ipsum",
                  iconData: Icons.send,
                ),
                HomePageItem(
                  title: "Contact",
                  description: "Lorem ipsum",
                  iconData: Icons.contact_emergency,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
