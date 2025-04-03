import 'package:intl/intl.dart';

String formatDate(String? dateString) {
  DateTime dateTime = DateTime.parse(dateString!);
  return DateFormat("d MMM, yyyy").format(dateTime);
}
