import 'package:intl/intl.dart';

class DateParser {
  final format = DateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'");

  String newDate({String? date}) {
    if (date != null) final newDate = format.parse(date);
    return newDate();
  }
}
