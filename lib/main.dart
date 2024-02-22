import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DalelApp());
}

class DalelApp extends StatelessWidget {
  const DalelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Image.asset(Assets.imagesOnBoarding1),
        ),
      ),
    );
  }
}
