import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/screens/app/home_page/home_page_screen.dart';
import 'package:finance_app/screens/app/my_card/my_card_screen.dart';
import 'package:finance_app/screens/app/profile/my_profile.dart';
import 'package:finance_app/screens/app/statistics/statistic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomePageScreen(),
    const StatisticsScreen(),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
    ),
    MyCardScreen(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          elevation: 5,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.sp),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_history, size: 30.sp),
              label: "Statistics",
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 48.sp,
                height: 48.sp,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(Icons.add, color: Colors.white, size: 30.sp),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership_outlined, size: 30.sp),
              label: "My Card",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30.sp),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
