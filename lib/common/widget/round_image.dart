// import 'package:flutter/material.dart';
// import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get_utils/src/extensions/context_extensions.dart';
// import 'package:get/instance_manager.dart';

// class RoundImage extends StatelessWidget {
//   final ChefScreenController widgetCtrl = Get.find<ChefScreenController>();
//   final double height;
//   final double width;

//   RoundImage({required this.height, required this.width});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           color: context.theme.textTheme.button!.color,
//           border: Border.all(
//               color: context.theme.textTheme.button!.color!, width: 4.0),
//           shape: BoxShape.circle,
//           image: DecorationImage(
//               image: NetworkImage(widgetCtrl.chef.value.chefImage),
//               fit: BoxFit.cover),
//         ),
//       ),
//     );
//   }
// }
