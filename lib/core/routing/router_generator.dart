import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/screens/Welcome.dart';
import 'package:finance_app/screens/app/app_screen.dart';
import 'package:finance_app/screens/auth/forget_pass_screen.dart';
import 'package:finance_app/screens/auth/login_screen.dart';
import 'package:finance_app/screens/auth/new_password.dart';
import 'package:finance_app/screens/auth/pass_changed.dart';
import 'package:finance_app/screens/auth/register_screen.dart';
import 'package:finance_app/screens/auth/otp_screen.dart';
import 'package:go_router/go_router.dart';

class RouterGenerator {
  static final GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.appScreen,
    routes: [
      GoRoute(
        path: AppRoutes.welcomeScreen,
        name: AppRoutes.welcomeScreen,
        builder: (context, state) => const Welcome(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        name: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgetPassScreen,
        name: AppRoutes.forgetPassScreen,
        builder: (context, state) => const ForgetPassScreen(),
      ),
      GoRoute(
        path: AppRoutes.verifyOtpScreen,
        name: AppRoutes.verifyOtpScreen,
        builder: (context, state) => const OTPScreen(),
      ),
      GoRoute(
        path: AppRoutes.newPassScreen,
        name: AppRoutes.newPassScreen,
        builder: (context, state) => const NewPassword(),
      ),
      GoRoute(
        path: AppRoutes.passSuccessfully,
        name: AppRoutes.passSuccessfully,
        builder: (context, state) => const PassChanged(),
      ),
      GoRoute(
        path: AppRoutes.appScreen,
        name: AppRoutes.appScreen,
        builder: (context, state) => const AppScreen(),
      ),
    ],
  );
}
