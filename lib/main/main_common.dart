import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/api.dart';
import 'package:food_yours_customer/app/app.dart';
import 'package:food_yours_customer/config/app_config.dart';

late ApiClient api;

void mainCommon(AppConfig config) {
    WidgetsFlutterBinding.ensureInitialized();

  api = ApiClient(Dio())
    ..setBaseOptions()
    ..setInterceptors();

  runApp(App(config));
}


// flutter build apk --release -t lib/main_tst.dart --build-name=1.0.0 --build-number=1 --flavor tst 
// flutter build appbundle --target-platform android-arm,android-arm64 --release -t lib/main_tst.dart --build-name=1.0.0 --build-number=1 --flavor tst
// flutter build ios --release --no-codesign -t lib/main_tst.dart --build-name=1.0.0 --build-number=1 --flavor tst