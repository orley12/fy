import 'package:food_yours_customer/common/repository/preference_repository.dart';
import 'package:food_yours_customer/common/repository/preference_repository_impl.dart';
import 'package:food_yours_customer/login/repository/auth_repository.dart';
import 'package:food_yours_customer/login/repository/auth_repository_impl.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

class AppBindings implements Bindings {
  @override
  dependencies() {
    Get.create<AuthRepository>(() => AuthRepositoryImpl());
    Get.putAsync<PreferenceRepository>(() async {
      return await PreferenceRepositoryImpl.getInstance();
    });
  }
}
