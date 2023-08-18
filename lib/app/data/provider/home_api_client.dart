import 'dart:convert';

import 'package:cflix/app/data/model/video_list_model.dart';
import 'package:flutter/services.dart';

class HomeApiClient{
  Future<VideoListModel> getVideoList() async {
    String jsonString = await rootBundle.loadString('assets/json/videos.json');
    final jsonResponse = jsonDecode(jsonString) as Map<String, dynamic>;
    await Future.delayed(const Duration(milliseconds: 500));
    return VideoListModel.fromJson(jsonResponse);
  }
}