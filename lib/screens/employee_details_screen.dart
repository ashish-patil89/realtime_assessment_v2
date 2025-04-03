import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_assessment_v2/common/common.dart';
import 'package:realtime_assessment_v2/l10n/l10n.dart';
import 'package:realtime_assessment_v2/models/models.dart';
import 'package:realtime_assessment_v2/utils/utils.dart';

import 'add_employee_screen.dart';
import 'screens.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(
      actions: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => AddEmployeeScreen(employee: employee),
              ),
            );
          },
        ),
      ],
      title: context.l10n.employeeLists,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${employee.name}", style: TextStyle(fontSize: 18)),
            Text("Role: ${employee.role}", style: TextStyle(fontSize: 18)),
            Text(
              "Start Date: ${formatDate(employee.startDate.toLocal().toString())}",
              style: TextStyle(fontSize: 18),
            ),
            employee.endDate?.toLocal().toString() == null
                ? Container()
                : Text(
                  "End Date: ${employee.endDate?.toLocal().toString() == null ? '' : formatDate(employee.endDate?.toLocal().toString())}",
                  style: TextStyle(fontSize: 18),
                ),
          ],
        ),
      ),
    );
  }
}
