import 'package:dalel_app/core/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DalelApp());
}

class DalelApp extends StatelessWidget {
  const DalelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
