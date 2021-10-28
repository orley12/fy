import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/api.dart';
import 'package:food_yours_customer/app/app.dart';
import 'package:food_yours_customer/common/service/hive_service.dart';
import 'package:food_yours_customer/config/app_config.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

late ApiClient api;

void mainCommon(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  api = ApiClient(Dio())
    ..setBaseOptions()
    ..setInterceptors();

  await Firebase.initializeApp();
  await Hive.initFlutter();

  HiveService.setUpHiveAdapters();
  await HiveService.openHiveBoxes();

  runApp(App(config));
}


// flutter build apk --release -t lib/main_tst.dart --build-name=1.0.0 --build-number=1 --flavor tst 
// flutter build appbundle --target-platform android-arm,android-arm64 --release -t lib/main_tst.dart --build-name=1.0.0 --build-number=1 --flavor tst
// flutter build ios --release --no-codesign -t lib/main_tst.dart --build-name=1.0.0 --build-number=1 --flavor tst