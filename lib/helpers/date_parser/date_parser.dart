import 'dart:core';

import 'package:intl/intl.dart';

class DateParser {
  final format = DateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'", 'en_US');
  final newFormat = DateFormat('EEEE, d MMMM y');
  late String newDate;
  late DateTime parsedDate;

  String parseDate({String? date}) {
    if (date != null) parsedDate = format.parse(date);
    newDate = newFormat.format(parsedDate).toString();
    return newDate;
  }
}
