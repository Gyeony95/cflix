import 'package:cflix/app/route/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/route/routes.dart';
import 'app/util/custom_scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cflix',
      getPages: AppPages.rootGetPage,
      scrollBehavior: CustomScrollBehavior(),
      initialRoute: Routes.home,
      builder: (context, child) => child!,
    );
  }
}

