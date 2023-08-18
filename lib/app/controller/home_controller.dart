import 'package:cflix/app/data/model/video_list_model.dart';
import 'package:cflix/app/data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/app_colors.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{

  RxBool isLoading = false.obs;

  Rx<VideoListModel?> listModel = Rx(null);

  late AnimationController animationController;
  late Animation colorTweenTop;
  late Animation colorTweenBottom;

  ScrollController homeScrollController = ScrollController();

  final HomeRepository repository;
  HomeController({required this.repository});


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
    getVideoList();
  }

  Future<void> getVideoList() async {
    var result = await repository.getVideoList();
    if((result.videoList ?? []).isNotEmpty){
      listModel.value = result;
    }
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