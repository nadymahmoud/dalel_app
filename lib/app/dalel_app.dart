import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DalelApp extends StatelessWidget {
  const DalelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.offWhite),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
