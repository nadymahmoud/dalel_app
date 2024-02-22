import 'package:dalel_app/core/functions/navigation.dart';

import 'package:dalel_app/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/widgets/get_buttons.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 40,
              ),
              customNauvBar(
                onTap: () {
                  customReplacementNavigate(context, '/signUp');
                },
              ),
              OnBoardingWidgetBody(
                onPageChanged: (index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                controller: _controller,
              ),
              SizedBox(
                height: 88,
              ),
              GetButtons(currentindex: currentindex, controller: _controller),
              SizedBox(
                height: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}
