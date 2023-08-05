import 'package:cflix/app/route/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/route/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cflix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppPages.rootGetPage,
      initialRoute: Routes.home,
      builder: (context, child) => child!,
    );
  }
}

