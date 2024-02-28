import 'package:dalel_app/core/models/data_model.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_data_list_view.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/widgets/custom_category_list_view.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_section/home_app_bar_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_section/period_details_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/period_wars_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoricalPeriodsDetailsView extends StatelessWidget {
  const HistoricalPeriodsDetailsView({super.key, required this.model});
  final HistericalPeriodsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeAppBarSection(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 7,
            ),
          ),
          SliverToBoxAdapter(
            child: PeriodDetailsSection(
              imageUrl: model.image,
              periodName: model.name,
              description: model.discription,
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 22,
          )),
          SliverToBoxAdapter(
            child: PeriodWarsSection(
              warsList: model.wars,
              routePath: '/warsDetailsView',
            ),
          ),
          SliverToBoxAdapter(
            child: RecommendationsSections(),
          ),
        ],
      ),
    ));
  }
}

class RecommendationsSections extends StatelessWidget {
  const RecommendationsSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalPeriods),
        SizedBox(
          height: 16,
        ),
        CustomCatedoryListView(),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
