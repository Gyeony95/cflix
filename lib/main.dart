import 'package:cflix/app/controller/main_controller.dart';
import 'package:cflix/app/route/pages.dart';
import 'package:cflix/app/ui/app_colors.dart';
import 'package:cflix/app/ui/widget/gradient_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/route/routes.dart';
import 'app/util/custom_scroll_behavior.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late MainController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put<MainController>(MainController(), permanent: true);
    return GetMaterialApp(
      title: 'Cflix',
      getPages: AppPages.rootGetPage,
      scrollBehavior: CustomScrollBehavior(),
      initialRoute: Routes.home,
      builder: (context, child) => Scaffold(
        backgroundColor: bgColor,
        body: NotificationListener<ScrollNotification>(
          onNotification: controller.scrollListener,
          child: Stack(
            children: [
              child!,
              _appbar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appbar() {
    return GradientAppbar(
      animationController: controller.animationController,
      colorTweenTop: controller.colorTweenTop,
      colorTweenBottom: controller.colorTweenBottom,
    );
  }
}
