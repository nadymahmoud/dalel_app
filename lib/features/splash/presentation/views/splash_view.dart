import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_textStyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnboardingVisited = getIt<CacheHelper>().getData(
          key: 'isOnboardingVisited',
        ) ??
        false;
    if (isOnboardingVisited == true) {
      FirebaseAuth.instance.currentUser == null
          ? delayNavigate(context, '/signin')
          : FirebaseAuth.instance.currentUser!.emailVerified == true
              ? delayNavigate(context, '/home')
              : delayNavigate(context, '/signin');
    } else {
      delayNavigate(context, '/onBoarding');
    }

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyle.pacifico400style64,
        ),
      ),
    );
  }
}

void delayNavigate(context, path) {
  Future.delayed(Duration(seconds: 2), () {
    customReplacementNavigate(context, path);
  });
}
