import 'package:intl/intl.dart';

class DateTimeUtil {
  static dateTimeToString(DateTime? dateTime) => DateFormat.yMd()
      .add_jm()
      .format(dateTime ?? DateTime.now()); //-> 7/10/1996 5:08 PM

}
