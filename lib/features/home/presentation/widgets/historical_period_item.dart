import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';

class HistoricalPeriod extends StatelessWidget {
  const HistoricalPeriod({super.key, required this.model});
  final HistericalPeriodsModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 164,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 10,
            offset: Offset(0, 7),
          )
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 16,
          ),
          SizedBox(
            height: 48,
            width: 62,
            child: Text(
              model.name,
              style: CustomTextStyle.Poppins500style18.copyWith(
                  fontSize: 16, color: AppColors.deepBrown),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 64,
            width: 47,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(model.image))),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
