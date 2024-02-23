import 'package:dalel_app/app/dalel_app.dart';
import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/check_state_changes.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  checkStateChanges();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const DalelApp());
}
