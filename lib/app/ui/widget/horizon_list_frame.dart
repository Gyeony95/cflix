import 'package:cflix/app/data/model/video_list_model.dart';
import 'package:cflix/app/ui/app_colors.dart';
import 'package:flutter/material.dart';

import 'video_item_numbering_widget.dart';

class HorizonListFrame extends StatelessWidget {
  final VideoListModel? model;
  /// 제목 영역을 제외한 높이
  final double contentHeight;
  const HorizonListFrame({
    Key? key,
    required this.model,
    required this.contentHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        _horizonList(),
      ],
    );
  }

  Widget _title() {
    if ((model?.listTitle ?? '').isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
          model!.listTitle!,
        style: TextStyle(
          color: cE5E5E5,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _horizonList() {
    return SizedBox(
      height: contentHeight,
      child: _list(),
    );
  }

  Widget _list() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return VideoItemNumberingWidget(item: model!.videoList![index],);

      },
      separatorBuilder: (_, __) {
        return const SizedBox(
          width: 0,
        );
      },
      itemCount: (model?.videoList ?? []).length,
    );
  }
}
