import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/functions/custom_toast.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_category.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_state.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_period_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalPeriodsFailure) {
          showToast(state.errerMassage);
        }
      },
      builder: (context, state) {
        return state is GetHistoricalPeriodsLoading
            ? CustomShimmerCategory()
            : SizedBox(
                height: 96,
                child: ListView.separated(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HistoricalPeriod(
                        model:
                            context.read<HomeCubit>().historicalPeriods[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount:
                        context.read<HomeCubit>().historicalPeriods.length),
              );

        // FutureBuilder<QuerySnapshot>(
        //     future: FirebaseFirestore.instance
        //         .collection(FireBaseStrings.historicalPeriods)
        //         .get(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError) {
        //         return Text("Something went wrong");
        //       }

        //       if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
        //         return Text("Document does not exist");
        //       }

        //       if (snapshot.connectionState == ConnectionState.done) {
        //         List<HistericalPeriodsModel> historicalPeriods = [];
        //         for (int i = 0; i < snapshot.data!.docs.length; i++) {
        //           historicalPeriods.add(
        //               HistericalPeriodsModel.fromJson(snapshot.data!.docs[i]));
        //         }
        //         return SizedBox(
        //           height: 96,
        //           child: ListView.separated(
        //               clipBehavior: Clip.none,
        //               scrollDirection: Axis.horizontal,
        //               itemBuilder: (context, index) {
        //                 return HistoricalPeriod(
        //                   model: historicalPeriods[index],
        //                 );
        //               },
        //               separatorBuilder: (context, index) {
        //                 return SizedBox(
        //                   width: 10,
        //                 );
        //               },
        //               itemCount: snapshot.data!.docs.length),
        //         );
        //       }
        //       return CustomShimmerCategory();
        //     });
      },
    );
  }
}
