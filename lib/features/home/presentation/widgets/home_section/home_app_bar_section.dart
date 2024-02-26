import 'package:dalel_app/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeAppBarSection extends StatelessWidget {
  const HomeAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 72,
        ),
        CustomHomeViewAppBar(),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
