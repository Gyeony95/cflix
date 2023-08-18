import 'package:cflix/app/data/model/video_list_model.dart';
import 'package:cflix/app/data/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  RxList<VideoItem> listModel = <VideoItem>[].obs;

  final HomeRepository repository;
  HomeController({required this.repository});


  @override
  void onInit() {
    super.onInit();
    getVideoList();
  }

  Future<void> getVideoList() async {
    var result = await repository.getVideoList();
    if((result.videoList ?? []).isNotEmpty){
      listModel.value = result.videoList ?? [];
    }
  }
}