import 'package:cflix/app/data/model/video_list_model.dart';
import 'package:flutter/material.dart';

class VideoItemNormalWidget extends StatelessWidget {
  final VideoItem item;

  const VideoItemNormalWidget({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Image.network(
        item.imageUrl!,
        height: 200,
        width: 250,
        fit: BoxFit.cover,
      ),
    );
  }
}
