import 'package:cflix/app/data/model/video_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoItemNumberingWidget extends StatelessWidget {
  final VideoItem item;

  const VideoItemNumberingWidget({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 90),
              child: SvgPicture.asset(
                'assets/svgs/rank_${item.videoId ?? 1}.svg',
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: Image.network(
                item.imageUrl!,
                // width: 120,
                height: 200,
                width: 110,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),

      ],
    );
  }
}
