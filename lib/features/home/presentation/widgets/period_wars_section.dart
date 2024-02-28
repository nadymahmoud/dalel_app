import 'package:dalel_app/core/models/data_model.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_data_list_view.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PeriodWarsSection extends StatelessWidget {
  const PeriodWarsSection(
      {super.key, required this.warsList, required this.routePath});
  final List<DataModel> warsList;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalPeriods),
        SizedBox(
          height: 16,
        ),
        Stack(clipBehavior: Clip.none, children: [
          Positioned(
              top: -52,
              right: 14,
              child: SvgPicture.asset(Assets.imagesDetails3)),
          CustomDataListView(dataList: warsList, routePath: routePath)
        ]),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
