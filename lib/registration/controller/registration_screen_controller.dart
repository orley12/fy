import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/login/screen/login_screen.dart';
import 'package:food_yours_customer/login/service/auth_service.dart';
import 'package:food_yours_customer/registration/model/registration_model.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/phone_util.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';

class RegistrationScreenController extends GetxController {
  final AuthService service = Get.put(AuthService());

  Rx<CountryCode> selectedCountryCode = CountryCode(
    flagUri: Images.ng,
    name: "Nigeria",
    code: "NG",
    dialCode: "+234",
  ).obs;

  final TextEditingController firstNameTextCtrl = TextEditingController();
  final TextEditingController lastNameTextCtrl = TextEditingController();
  final TextEditingController phoneNumberTextCtrl = TextEditingController();
  final TextEditingController emailTextCtrl = TextEditingController();
  final TextEditingController passwordTextCtrl = TextEditingController();
  final TextEditingController confirmPasswordTextCtrl = TextEditingController();

  RxString firstNameError = "".obs;
  RxString lastNameError = "".obs;
  RxString phoneNumberError = "".obs;
  RxString emailError = "".obs;
  RxString passwordError = "".obs;
  RxString confirmPasswordError = "".obs;

  RxString loadingMessage = "registering ...".obs;

  clearFirstNameError(_) => firstNameError.value = "";
  clearLastNameError(_) => lastNameError.value = "";
  clearPhoneNumberError(_) => phoneNumberError.value = "";
  clearEmailError(_) => emailError.value = "";
  clearPasswordError(_) => passwordError.value = "";
  clearConfirmPasswordError(_) => confirmPasswordError.value = "";

  RxBool isLoading = false.obs;
  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;

  toggleObscurePassword() => obscurePassword.value = !obscurePassword.value;
  toggleObscureConfirmPassword() => obscureConfirmPassword.value = !obscureConfirmPassword.value;

  validateInputs() async {
    if (GetUtils.isBlank(firstNameTextCtrl.text)!) {
      firstNameError.value = Strings.blankFieldErrorMessage;
    } else if (GetUtils.isBlank(lastNameTextCtrl.text)!) {
      lastNameError.value = Strings.blankFieldErrorMessage;
    } else if ((await isPhoneNumberValid(phoneNumberTextCtrl.text, selectedCountryCode.value.code!)) == false) {
      phoneNumberError.value = Strings.validPhoneNumberErrorMessage;
    } else if (!GetUtils.isEmail(emailTextCtrl.text)) {
      emailError.value = Strings.validPhoneNumberErrorMessage;
    } else if (GetUtils.isBlank(passwordTextCtrl.text)!) {
      passwordError.value = Strings.blankFieldErrorMessage;
    } else if (GetUtils.isBlank(confirmPasswordTextCtrl.text)!) {
      confirmPasswordError.value = Strings.blankFieldErrorMessage;
    } else {
      signUp();
    }
  }

  signUp() async {
    isLoading.value = true;

    RegistrationModel registrationModel = await setRegistrationInformation();

    AppResponse response = await service.signUp(registrationModel.toJSON());

    isLoading.value = false;

    showFYSnackBar(message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    return gotoNextScreen();
  }

  gotoLoginScreen() => push(page: LoginScreen());

  Future<RegistrationModel> setRegistrationInformation() async {
    return RegistrationModel(
      firstName: firstNameTextCtrl.text,
      lastName: lastNameTextCtrl.text,
      phoneNumber: await normalizePhoneNumber(phoneNumberTextCtrl.text, selectedCountryCode.value.code!),
      email: emailTextCtrl.text,
      password: passwordTextCtrl.text,
      confirmPassword: confirmPasswordTextCtrl.text,
    );
  }

  void gotoNextScreen() => pushUntil(page: LoginScreen());

  onCountrySelected(CountryCode countryCode) {
    selectedCountryCode.value = countryCode;
  }
}
