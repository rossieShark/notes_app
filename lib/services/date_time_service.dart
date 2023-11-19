import 'package:intl/intl.dart';

class DateTimeService {
  DateTime convertToEDDMM(String date) {
    DateFormat inputFormat = DateFormat('E, dd MMMM', 'en_US');
    return inputFormat.parse(date);
  }

  DateTime convertToHHMM(String date) {
    DateFormat inputFormat = DateFormat("HH:mm", "en");
    return inputFormat.parse(date);
  }
}
