import 'package:cflix/app/data/model/video_list_model.dart';
import 'package:cflix/app/data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{

  RxBool isLoading = false.obs;

  /// 상단의 랭크 리스트
  Rx<VideoListModel?> rankList = Rx(null);

  /// 랭크리스트 밑으로 보이는 모든 리스트
  RxList<VideoListModel?> videoList = <VideoListModel?>[(null)].obs;

  ScrollController homeScrollController = ScrollController();

  final HomeRepository repository;
  HomeController({required this.repository});


  @override
  void onInit() {
    super.onInit();
    getRankVideoList();
    getVideoList();
  }

  Future<void> getRankVideoList() async {
    var result = await repository.getRankVideoList();
    if(result == null) return;
    if((result.videoList ?? []).isNotEmpty){
      rankList.value = result;
    }
  }

  Future<void> getVideoList() async {
    var result = await repository.getVideoList();
    if(result.isNotEmpty){
      videoList.value = result;
    }
  }
}