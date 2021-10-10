import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/resources/Images.dart';

class TabInfoViewModel {
  final bool isSelected;
  final SvgPicture tabIcon;
  final String tabText;

  TabInfoViewModel(this.isSelected, this.tabIcon, this.tabText);

  static List<Map> getList() {
    return [
      {"image": Images.home, "label": "Home"},
      {"image": Images.document, "label": "Orders"},
      {"image": Images.shoppingCart, "label": "Cart"},
      {"image": Images.user, "label": "Profile"},
    ];
  }
}
