import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/models/data_model.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomDataListViewItem extends StatelessWidget {
  const CustomDataListViewItem(
      {super.key, required this.model, required this.routePath});
  final DataModel model;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, routePath, extra: model);
      },
      child: Container(
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
              child: CachedNetworkImage(
                imageUrl: model.image,
                placeholder: (context, url) => Shimmer.fromColors(
                    child: Container(
                      height: 64,
                      width: 47,
                      color: AppColors.grey,
                    ),
                    baseColor: AppColors.grey,
                    highlightColor: Colors.white),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
