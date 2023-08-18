class VideoListModel {
  int? resultCode;
  String? resultMessage;
  String? listTitle;
  List<VideoItem>? videoList;

  VideoListModel({
    this.resultCode,
    this.resultMessage,
    this.videoList,
    this.listTitle,
  });

  VideoListModel.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    resultMessage = json['resultMessage'];
    listTitle = json['listTitle'];
    if (json['videoList'] != null) {
      videoList = <VideoItem>[];
      json['videoList'].forEach((v) {
        videoList!.add(VideoItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCode'] = resultCode;
    data['resultMessage'] = resultMessage;
    data['listTitle'] = listTitle;
    if (videoList != null) {
      data['videoList'] = videoList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideoItem {
  int? videoId;
  String? originalYn;
  String? newSeasonYn;
  String? newEpisodeYn;
  String? imageUrl;
  int? rank;

  VideoItem(
      {this.videoId,
      this.originalYn,
      this.newSeasonYn,
      this.newEpisodeYn,
      this.imageUrl,
      this.rank});

  VideoItem.fromJson(Map<String, dynamic> json) {
    videoId = json['videoId'];
    originalYn = json['originalYn'];
    newSeasonYn = json['newSeasonYn'];
    newEpisodeYn = json['newEpisodeYn'];
    imageUrl = json['imageUrl'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videoId'] = videoId;
    data['originalYn'] = originalYn;
    data['newSeasonYn'] = newSeasonYn;
    data['newEpisodeYn'] = newEpisodeYn;
    data['imageUrl'] = imageUrl;
    data['rank'] = rank;
    return data;
  }
}
