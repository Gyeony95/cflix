import 'package:cflix/app/data/model/video_list_model.dart';
import 'package:cflix/app/ui/app_colors.dart';
import 'package:cflix/app/ui/widget/video_item_normal_widget.dart';
import 'package:flutter/material.dart';

import 'video_item_numbering_widget.dart';

class HorizonListFrame extends StatelessWidget {
  final VideoListModel? model;

  /// 제목 영역을 제외한 높이
  final double contentHeight;
  final bool isNumberWidget;
  final double padding;

  const HorizonListFrame({
    Key? key,
    required this.model,
    required this.contentHeight,
    this.isNumberWidget = false,
    this.padding = 48,
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
      padding: EdgeInsets.only(bottom: 12, left: padding),
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
        return Padding(
          padding: EdgeInsets.only(left: index == 0 ? padding : 0),
          child: isNumberWidget
              ? VideoItemNumberingWidget(
                  item: model!.videoList![index],
                )
              : VideoItemNormalWidget(item: model!.videoList![index]),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 0),
      itemCount: (model?.videoList ?? []).length,
    );
  }
}
