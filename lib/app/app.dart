import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_yours_customer/app/controller/app_controller.dart';
import 'package:food_yours_customer/resources/theme.dart';
import 'package:food_yours_customer/splash/screen/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';

class App extends StatelessWidget {
  final AppController appController = Get.put(AppController());
  // This widget is the root of your application.
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
        theme: Themes.light,
        home: SplashScreen(),
      ),
    );
  }
}
