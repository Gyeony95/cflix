import 'package:cflix/app/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController with GetSingleTickerProviderStateMixin{

  /// 앱바의 컬러를 바꾸기 위한 값들
  late AnimationController animationController;
  late Animation colorTweenTop;
  late Animation colorTweenBottom;


  @override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    //색상 설정, 투명 -> 검정
    colorTweenTop = ColorTween(begin: c202020.withOpacity(0.78), end: c141414)
        .animate(animationController);
    colorTweenBottom = ColorTween(begin: c202020.withOpacity(0), end: c141414)
        .animate(animationController);
  }

  /// ### 스크롤시 앱바의 색상을 투명 -> 검은색으로 바꿔주기 위한 이벤트 리스너
  bool scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      animationController.animateTo(scrollInfo.metrics.pixels / 130);
      return true;
    }
    return false;
  }
}