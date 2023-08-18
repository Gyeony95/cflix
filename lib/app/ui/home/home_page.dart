import 'package:cflix/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../app_colors.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c141414,
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return Container();
  }
}
