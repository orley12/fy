import 'dart:async';

import 'package:food_yours_customer/config/app_config.dart';
import 'package:food_yours_customer/main/main_common.dart';

Future<void> main() async {
  // async can be useful if you fetch from disk or network
  // do flavor specific configuration here e.g. API endpoints
  final config = AppConfig(environment: 'dev');

  mainCommon(config);
}
