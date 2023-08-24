import 'package:cflix/app/controller/home_controller.dart';
import 'package:cflix/app/ui/app_colors.dart';
import 'package:cflix/app/ui/widget/gradient_app_bar.dart';
import 'package:cflix/app/ui/widget/horizon_list_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: NotificationListener<ScrollNotification>(
        onNotification: controller.scrollListener,
        child: Stack(
          children: [
            _buildBody(),
            _appbar(),
          ],
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

  Widget _buildBody() {
    return SingleChildScrollView(
      controller: controller.homeScrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _homeBanner(),
        ],
      ),
    );
  }

  Widget _homeBanner() {
    return Stack(
      children: [
        Image.network(
          'https://occ-0-395-988.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABeBgUvEDcFjkG-y0AnC1Oyb4yrcY1WvP4hChjC0SNx9wo1ATNxwlDCymY5uuScx-acFYzECoG9LI318mNC4KiIWFTTujby_tvtNw.webp?r=382',
          height: 684,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 684,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                cTransparent,
                c141414,
              ],
              stops: const [
                0.9,
                1.0,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 48,
          right: 48,
          child: Obx(
            () => HorizonListFrame(
              model: controller.listModel.value,
              contentHeight: 120,
            ),
          ),
        ),
      ],
    );
  }
}
