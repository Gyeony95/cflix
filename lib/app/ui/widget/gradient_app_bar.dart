import 'package:cflix/app/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientAppbar extends StatelessWidget {
  final AnimationController animationController;
  final Animation colorTweenTop;
  final Animation colorTweenBottom;
  final Widget? titleChild;
  const GradientAppbar({
    Key? key,
    required this.animationController,
    required this.colorTweenTop,
    required this.colorTweenBottom,
    this.titleChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return positionAppBar();
  }

  /// 스택으로 쌓여져있는 앱바
  Widget positionAppBar() {
    final double statusBarHeight = MediaQuery.of(Get.context!).padding.top;
    return SizedBox(
      height: statusBarHeight + kToolbarHeight, // 상단바 + AppBar 높이
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, build) => AppBar(
          title: titleChild ?? const SizedBox(),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorTweenTop.value, colorTweenBottom.value],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          backgroundColor: cTransparent, //appBar 투명색
          elevation: 0.0, //appBar 그림자 농도 설정 (값 0으로 제거)
        ),
      ),
    );
  }
}
