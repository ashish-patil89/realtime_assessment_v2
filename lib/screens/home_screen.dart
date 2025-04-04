import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_assessment_v2/common/common.dart';
import 'package:realtime_assessment_v2/l10n/l10n.dart';
import 'package:realtime_assessment_v2/models/models.dart';
import 'package:realtime_assessment_v2/utils/utils.dart';

import 'cubit/employee_state.dart';
import 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeeCubit>().loadEmployees();
  }

  @override
  Widget build(BuildContext context) {
    final employees = context.select(
      (EmployeeCubit cubit) => cubit.state.employees ?? [],
    );

    List<Employee> currentEmployees =
        employees
            .where(
              (e) => e.endDate == null || e.endDate!.isAfter(DateTime.now()),
            )
            .toList();
    List<Employee> previousEmployees =
        employees
            .where(
              (e) => e.endDate != null && e.endDate!.isBefore(DateTime.now()),
            )
            .toList();

    return BlocListener<EmployeeCubit, EmployeeState>(
      listener: (context, state) {
        if (state.employeeToDelete != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.l10n.employeeDeleted),
              action: SnackBarAction(
                label: context.l10n.undo,
                onPressed: () {
                  context.read<EmployeeCubit>().addEmployee(
                    state.employeeToDelete!,
                  );
                },
              ),
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      listenWhen:
          (previous, current) => previous.employees != current.employees,
      child: AppBaseScaffold(
        title: context.l10n.employeeLists,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.appBlueColor,
          foregroundColor: AppColors.appWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ), // Adjust the radius as needed
          ),

          onPressed: () async {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => AddEmployeeScreen(employee: null),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        child:
            (currentEmployees.isNotEmpty || previousEmployees.isNotEmpty)
                ? ListView(
                  children: [
                    // Header for Current Employees
                    if (currentEmployees.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.02,
                          horizontal: MediaQuery.of(context).size.width * 0.04,
                        ),
                        child: Text(
                          context.l10n.currentEmployees,
                          style: AppTextStyles.fontC7.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.appBlueColor,
                          ),
                        ),
                      ),

                    // Current Employees List with Swipe to Delete
                    ...currentEmployees.map(
                      (employee) => Dismissible(
                        key: ValueKey(
                          employee.hashCode,
                        ), // Unique key for each item
                        direction:
                            DismissDirection.endToStart, // Swipe left to delete
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.red,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                            color: AppColors.appWhiteColor,
                          ),
                        ),
                        onDismissed: (direction) {
                          context.read<EmployeeCubit>().deleteEmployee(
                            employee,
                          );
                        },
                        child: _employeeListTile(context, employee, true),
                      ),
                    ),

                    // Divider
                    // if (previousEmployees.isNotEmpty) Divider(),

                    // Header for Previous Employees
                    if (previousEmployees.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.02,
                          horizontal: MediaQuery.of(context).size.width * 0.04,
                        ),
                        child: Text(
                          context.l10n.previousEmployees,
                          style: AppTextStyles.fontC7.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.appBlueColor,
                          ),
                        ),
                      ),

                    // Previous Employees List with Swipe to Delete
                    ...previousEmployees.map(
                      (employee) => Dismissible(
                        key: ValueKey(
                          employee.hashCode,
                        ), // Unique key for each item
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.red,
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          context.read<EmployeeCubit>().deleteEmployee(
                            employee,
                          );
                        },
                        child: _employeeListTile(context, employee, false),
                      ),
                    ),
                  ],
                )
                : Center(
                  child: SvgPicture.asset(
                    'assets/images/no_records.svg',
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
      ),
    );
  }

  Widget _employeeListTile(
    BuildContext context,
    Employee employee,
    bool isCurrent,
  ) {
    return EmployeeListItem(employee: employee, isCurrent: isCurrent);
  }
}
