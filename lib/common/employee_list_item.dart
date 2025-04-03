import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_assessment_v2/models/employee_model.dart';
import 'package:realtime_assessment_v2/screens/add_employee_screen.dart';
import 'package:realtime_assessment_v2/utils/app_colors.dart';
import 'package:realtime_assessment_v2/utils/constants.dart';

import '../utils/app_fonts.dart';

class EmployeeListItem extends StatelessWidget {
  const EmployeeListItem({super.key, required this.employee});
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => AddEmployeeScreen(employee: employee),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            color: AppColors.appBgWhiteColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          employee.name,
                          style: AppTextStyles.fontC7.copyWith(),
                        ),
                        SizedBox(height: 6),
                        Text(
                          employee.role,
                          style: AppTextStyles.text14Regular.copyWith(
                            color: AppColors.color7,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              formatDate(
                                employee.startDate.toLocal().toString(),
                              ),
                              style: AppTextStyles.text12Regular.copyWith(
                                color: AppColors.color7,
                              ),
                            ),
                            employee.endDate?.toLocal() == null
                                ? Container()
                                : Text(
                                  ' - ',
                                  style: TextStyle(color: AppColors.color7),
                                ),

                            employee.endDate?.toLocal() == null
                                ? Container()
                                : Text(
                                  formatDate(
                                    employee.endDate?.toLocal().toString(),
                                  ),
                                  style: AppTextStyles.text12Regular.copyWith(
                                    color: AppColors.color7,
                                  ),
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: AppColors.color7.withOpacity(.1)),
        ],
      ),
    );
  }
}
