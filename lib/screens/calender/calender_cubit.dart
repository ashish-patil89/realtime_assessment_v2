import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarCubit extends Cubit<DateTime> {
  CalendarCubit() : super(DateTime.now());

  void selectDate(DateTime date) => emit(date);
  void incrementWeek() => emit(state.add(Duration(days: 7)));
  void incrementMonth() => emit(state.add(Duration(days: 30)));
  void decrementWeek() => emit(state.subtract(Duration(days: 7)));
  void decrementMonth() => emit(state.subtract(Duration(days: 30)));
  void setToday() => emit(DateTime.now());
  void setNextMonday() => emit(_nextWeekday(DateTime.monday));
  void setNextTuesday() => emit(_nextWeekday(DateTime.tuesday));

  static DateTime _nextWeekday(int weekday) {
    DateTime now = DateTime.now();
    int daysUntilNext = (weekday - now.weekday) % 7;
    return now.add(Duration(days: daysUntilNext == 0 ? 7 : daysUntilNext));
  }
}
