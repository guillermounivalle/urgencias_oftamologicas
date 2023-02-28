import 'package:intl/intl.dart';

class OFTDateUtils {
  static final String DATE_FORMAT = "MM/dd/yyyy";

  static String format(DateTime date) {
    var format = DateFormat(DATE_FORMAT);
    return format.format(date);
  }
}