import 'package:food_yours_customer/auth/repository/auth_repository.dart';
import 'package:food_yours_customer/auth/repository/auth_repository_impl.dart';
import 'package:food_yours_customer/auth/service/auth_service.dart';
import 'package:food_yours_customer/cart/service/food_yours_payment_service/food_yours_payment_service.dart';
import 'package:food_yours_customer/cart/service/paystack_payment_service/paystack_payment_service.dart';
import 'package:food_yours_customer/cart/service/paystack_payment_service/paystack_payment_service_impl.dart';
import 'package:food_yours_customer/common/repository/preference_repository/preference_repository.dart';
import 'package:food_yours_customer/common/repository/preference_repository/preference_repository_impl.dart';
import 'package:food_yours_customer/home/repository/product_repository.dart';
import 'package:food_yours_customer/home/repository/product_repository_impl.dart';
import 'package:food_yours_customer/home/service/product_service.dart';
import 'package:food_yours_customer/user/repository/user_repository.dart';
import 'package:food_yours_customer/user/repository/user_repository_impl.dart';
import 'package:food_yours_customer/user/service/user_service.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

class AppBindings implements Bindings {
  @override
  dependencies() {
    Get.create<AuthRepository>(() => AuthRepositoryImpl());
    Get.create<AuthService>(() => AuthService());
    Get.create<UserService>(() => UserService());
    Get.create<UserRepository>(() => UserRepositoryImpl());
    Get.create<ProductService>(() => ProductService());
    Get.create<FoodYoursPaymentService>(() => FoodYoursPaymentService());
    Get.create<ProductRepository>(() => ProductRepositoryImpl());
    Get.putAsync<PreferenceRepository>(() async {
      return await PreferenceRepositoryImpl.getInstance();
    });
    Get.lazyPut<PayStackPaymentService>(() => PayStackPaymentServiceImpl());
  }
}
