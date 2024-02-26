import 'package:dalel_app/core/functions/custom_toast.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/presentation/widgets/custom_category_list_view.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_periods_widget.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_section/historical_characters_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_section/historical_period_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_section/historical_souvenir_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_section/home_app_bar_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: HomeAppBarSection(),
            ),
            SliverToBoxAdapter(
              child: HistoricalPeriodsSection(),
            ),
            SliverToBoxAdapter(
              child: HistoricalCharactersSection(),
            ),
            SliverToBoxAdapter(
              child: HistoricalSouvenirSections(),
            ),
          ],
        ),
      ),
    );
  }
}
