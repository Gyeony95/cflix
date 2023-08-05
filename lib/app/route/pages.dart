import 'package:cflix/app/binding/home_binding.dart';
import 'package:cflix/app/route/routes.dart';
import 'package:cflix/app/ui/home/home_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final rootGetPage = <GetPage>[
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => HomePage(),
    ),
    ...pages
  ];

  static final pages = [
    // GetPage(
    //   name: Routes.main,
    //   page: () => const MainPage(),
    // ),
    // GetPage(
    //   name: Routes.login,
    //   page: () => const LoginScreen(),
    // ),

  ];
}