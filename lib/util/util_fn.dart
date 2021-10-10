import 'dart:io';

import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> getImage(ImageSource source) async {
  try {
    ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(source: source, imageQuality: 20, maxHeight: 500, maxWidth: 500);
    return pickedFile?.path != null ? File(pickedFile!.path) : null;
  } catch (e) {
    showFYSnackBar(message: "Unable to select image", responseGrades: ResponseGrades.WARNING);
  }
}
