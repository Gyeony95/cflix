import 'package:cflix/app/data/model/video_list_model.dart';
import 'package:cflix/app/data/provider/home_api_client.dart';

class HomeRepository{
  final HomeApiClient client;
  const HomeRepository({required this.client});

  Future<VideoListModel> getVideoList() async {
    return await client.getVideoList();
  }
}