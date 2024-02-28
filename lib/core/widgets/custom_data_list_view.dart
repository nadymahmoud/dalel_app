import 'package:dalel_app/core/models/data_model.dart';
import 'package:dalel_app/core/widgets/custom_data_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomDataListView extends StatelessWidget {
  const CustomDataListView({
    super.key,
    required this.dataList,
    required this.routePath,
  });
  final List<DataModel> dataList;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomDataListViewItem(
              model: dataList[index],
              routePath: routePath,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10,
            );
          },
          itemCount: dataList.length),
    );
  }
}
