import 'package:libphonenumber/libphonenumber.dart';

Future<bool?> isPhoneNumberValid(String phoneNumber, String isoCode) async {
  if (phoneNumber.length == 1) {
    return false;
  } else {
    return await PhoneNumberUtil.isValidPhoneNumber(phoneNumber: phoneNumber, isoCode: isoCode);
  }
}

Future normalizePhoneNumber(String phoneNumber, String isoCode) async {
  String? normalizePhoneNumber = await PhoneNumberUtil.normalizePhoneNumber(phoneNumber: phoneNumber, isoCode: isoCode);
  return normalizePhoneNumber!.substring(1);
}
