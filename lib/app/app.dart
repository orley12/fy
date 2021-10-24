import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_yours_customer/app/app_bindings.dart';
import 'package:food_yours_customer/app/controller/app_controller.dart';
import 'package:food_yours_customer/config/app_config.dart';
import 'package:food_yours_customer/resources/theme.dart';
import 'package:food_yours_customer/splash/screen/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';

class App extends StatelessWidget {
  final AppController appController = Get.put(AppController());

  App(AppConfig config);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GestureDetector(
      onTap: appController.closeKeyBoard,
      child: GetMaterialApp(
        title: 'Food Yours',
        initialBinding: AppBindings(),
        theme: Themes.light,
        home: SplashScreen(),
      ),
    );
  }
}
