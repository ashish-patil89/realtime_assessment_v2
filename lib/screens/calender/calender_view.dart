import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:realtime_assessment_v2/l10n/l10n.dart';

import '../../common/app_button.dart';
import '../../utils/app_colors.dart';
import 'calender_cubit.dart';

class CustomCalendarDialog extends StatelessWidget {
  const CustomCalendarDialog(this.isStartDate, {super.key});

  final bool isStartDate;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: CalendarView(isStartDate),
    );
  }
}

class CalendarView extends StatelessWidget {
  const CalendarView(this.isStartDate, {super.key});

  final bool isStartDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 396,
      height: 544,
      decoration: BoxDecoration(
        color: AppColors.appBgWhiteColor,
        borderRadius: BorderRadius.circular(16), // <-- Rounded corners
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: AppButton(
                        onPressed: () {
                          context.read<CalendarCubit>().setToday();
                        },
                        title: context.l10n.today,
                        backgroundColor: AppColors.calenderButtonColor,
                        textColor: AppColors.calenderButtonTextColor,
                      ),
                    ),
                    const Gap(8),
                    Expanded(
                      child: AppButton(
                        onPressed: () {
                          context.read<CalendarCubit>().setNextMonday();
                        },
                        title: context.l10n.nextMonday,
                        backgroundColor: AppColors.appBlueColor,
                        textColor: AppColors.appWhiteColor,
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppButton(
                        onPressed: () {
                          context.read<CalendarCubit>().setNextTuesday();
                        },
                        title: context.l10n.nextTuesday,

                        backgroundColor: AppColors.calenderButtonColor,
                        textColor: AppColors.calenderButtonTextColor,
                      ),
                    ),
                    const Gap(8),
                    Expanded(
                      child: AppButton(
                        onPressed: () {
                          context.read<CalendarCubit>().incrementWeek();
                        },
                        title: context.l10n.after1Week,

                        backgroundColor: AppColors.calenderButtonColor,
                        textColor: AppColors.calenderButtonTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Expanded(child: CalendarWidget(isStartDate)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'Cancel',
                  backgroundColor: AppColors.calenderButtonColor,
                  textColor: AppColors.calenderButtonTextColor,
                ),
                const Gap(16),
                AppButton(
                  onPressed: () {
                    Navigator.pop(context, context.read<CalendarCubit>().state);
                  },
                  title: 'Save',
                  backgroundColor: AppColors.appBlueColor,
                  textColor: AppColors.appWhiteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget(this.isStartDate, {super.key});

  final bool isStartDate;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime selectedMonth = DateTime.now();

  void changeMonth(int offset) {
    setState(() {
      selectedMonth = DateTime(
        selectedMonth.year,
        selectedMonth.month + offset,
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth = DateTime(
      selectedMonth.year,
      selectedMonth.month,
      1,
    );
    int daysInMonth =
        DateTime(selectedMonth.year, selectedMonth.month + 1, 0).day;
    int startingWeekday =
        firstDayOfMonth.weekday % 7; // Adjust for Sunday-based week

    List<DateTime?> days =
        List<DateTime?>.filled(
          (startingWeekday == 7 ? 0 : startingWeekday),
          null,
        ) +
        List.generate(
          daysInMonth,
          (index) => firstDayOfMonth.add(Duration(days: index)),
        );

    return Column(
      children: [
        // Header with Month Navigation
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_left),
              onPressed: () => changeMonth(-1),
            ),
            Text(
              DateFormat.yMMMM().format(selectedMonth),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: () => changeMonth(1),
            ),
          ],
        ),
        SizedBox(height: 10),

        // Weekday Labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                  .map(
                    (day) => Text(
                      day,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                  .toList(),
        ),
        SizedBox(height: 10),

        // Calendar Grid
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, // 7 days in a week
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: days.length,
          itemBuilder: (context, index) {
            DateTime? date = days[index];

            return BlocBuilder<CalendarCubit, DateTime>(
              builder: (context, selectedDate) {
                bool isSelected =
                    date != null &&
                    DateFormat('yyyy-MM-dd').format(selectedDate) ==
                        DateFormat('yyyy-MM-dd').format(date);

                return GestureDetector(
                  onTap:
                      date != null
                          ? () => {
                            context.read<CalendarCubit>().selectDate(date),
                          }
                          : null,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? Colors.blue
                              : (date == null
                                  ? Colors.transparent
                                  : Colors.grey[200]),
                      shape:
                          date == null ? BoxShape.rectangle : BoxShape.circle,
                    ),
                    child:
                        date != null
                            ? Text(
                              DateFormat.d().format(date),
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            )
                            : SizedBox(), // Empty slots stay blank
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
