import 'package:get/get.dart';
import 'package:pos_android/bindings/auth_binding.dart';
import 'package:pos_android/bindings/home_binding.dart';
import 'package:pos_android/bindings/landing_binding.dart';
import 'package:pos_android/screens/auth/login_screen.dart';
import 'package:pos_android/screens/error/error_device_screen.dart';
import 'package:pos_android/screens/home/home_screen.dart';
import 'package:pos_android/screens/landing_page.dart';
import 'package:pos_android/screens/order/order_cancel_screen.dart';
import 'package:pos_android/screens/payment/payment_done_screen.dart';
import 'package:pos_android/screens/payment/payment_screen.dart';
import 'package:pos_android/screens/pricing/pricing_report_screen.dart';
import 'package:pos_android/screens/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.initial;

  static final route = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
    ),
    // auth
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),

    // S
    GetPage(
      name: Routes.landing,
      page: () => const LandingPage(),
      binding: LandingBinding(),
    ),

    // ------------------------------------------------------->
    // Main
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.payment,
      page: () => const PaymentScreen(),
    ),
    GetPage(
      name: Routes.paymentDone,
      page: () => const PaymentDoneScreen(),
    ),

    // ------------------------------------------------------->
    // Future: order
    GetPage(
      name: Routes.orderCancel,
      page: () => const OrderCancelScreen(),
      fullscreenDialog: true,
    ),

    GetPage(
      name: Routes.syncDataMaster,
      page: () => const OrderCancelScreen(),
      fullscreenDialog: false,
    ),

    GetPage(
      name: Routes.reportPricing,
      page: () => const PricingReportScreen(),
      transition: Transition.cupertino
    ),

    // ------------------------------------------------------->
    // Error: device support
    GetPage(
      name: Routes.errorDevice,
      page: () => const ErrorDeviceScreen(),
    ),
  ];
}
