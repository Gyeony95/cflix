import 'dart:convert';

import 'package:cflix/app/data/model/result.dart';
import 'package:cflix/app/data/model/video_list_model.dart';
import 'package:cflix/app/util/data_util.dart';
import 'package:flutter/services.dart';

class HomeApiClient{
  Future<Result<List<VideoListModel>>?> getRankVideoList() async {
    String jsonString = await rootBundle.loadString('assets/json/rank_videos.json');
    final jsonResponse = jsonDecode(jsonString) as Map<String, dynamic>;
    await Future.delayed(const Duration(milliseconds: 500));
    final listInfo = DataUtil.jsonToList<VideoListModel>(
        'listInfo', jsonResponse, VideoListModel.fromJson);
    return Result.fromJson(jsonResponse, listInfo);
  }

  Future<Result<List<VideoListModel>>?> getVideoList() async {
    String jsonString = await rootBundle.loadString('assets/json/videos.json');
    final jsonResponse = jsonDecode(jsonString) as Map<String, dynamic>;
    await Future.delayed(const Duration(milliseconds: 500));
    final listInfo = DataUtil.jsonToList<VideoListModel>(
        'listInfo', jsonResponse, VideoListModel.fromJson);
    return Result.fromJson(jsonResponse, listInfo);
  }
}