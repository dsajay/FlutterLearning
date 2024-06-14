import 'package:intl/intl.dart';

class DateUtilsFormat{
  static String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd/MM/yy hh:mm a');
    return formatter.format(dateTime);
  }
}