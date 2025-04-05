import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:realtime_assessment_v2/common/app_base_scaffold.dart';
import 'package:realtime_assessment_v2/common/app_button.dart';
import 'package:realtime_assessment_v2/l10n/l10n.dart';
import 'package:realtime_assessment_v2/models/models.dart';
import 'package:realtime_assessment_v2/utils/utils.dart';

import 'calender/calender_view.dart';
import 'cubit/employee_cubit.dart';
import 'screens.dart';

class AddEmployeeScreen extends StatefulWidget {
  final Employee? employee;

  const AddEmployeeScreen({super.key, this.employee});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _nameController = TextEditingController();
  String? _selectedRole;
  DateTime? _startDate;
  DateTime? _endDate;

  final List<String> roles = [
    'Product Manager',
    'Flutter Developer',
    'QA Tester',
    'Product Owner',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      _nameController.text = widget.employee!.name;
      _selectedRole = widget.employee!.role;
      _startDate = widget.employee!.startDate;
      _endDate = widget.employee!.endDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(
      title:
          widget.employee == null
              ? context.l10n.addEmployeeDetails
              : context.l10n.editEmployeeDetails,
      actions:
          widget.employee == null
              ? []
              : [
                IconButton(
                  onPressed: () {
                    final employee = widget.employee!;
                    context.read<EmployeeCubit>().deleteEmployee(employee);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.delete),
                  color: AppColors.appWhiteColor,
                ),
              ],
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  style: AppTextStyles.fontD8.copyWith(
                    color: AppColors.fontBlackColor,
                  ),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: context.l10n.employeeName,
                    hintStyle: AppTextStyles.fontD8.copyWith(
                      color: AppColors.color7,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10), // Adjust padding as needed
                      child: SvgPicture.asset(
                        "assets/icons/person.svg", // Replace with your SVG file path
                      ),
                    ),
                    filled: false,
                    fillColor: Colors.white,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4), // Circular border
                      borderSide: BorderSide(color: AppColors.color10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: AppColors.color10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: AppColors.color10),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),

                const Gap(16),

                // Role Selection Dropdown
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: AppColors.appWhiteColor,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:
                                roles.asMap().entries.map((entry) {
                                  final int index = entry.key;
                                  final String role = entry.value;

                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedRole = role;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              double
                                                  .infinity, // Makes the entire row clickable
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                          ), // Adjust padding as needed
                                          color:
                                              Colors
                                                  .transparent, // Ensures tap detection
                                          child: Center(
                                            child: Text(
                                              role,
                                              style: AppTextStyles.fontD8
                                                  .copyWith(
                                                    color:
                                                        AppColors
                                                            .fontBlackColor,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (index !=
                                          roles.length -
                                              1) // Show divider only if it's not the last element
                                        Divider(color: AppColors.color10),
                                    ],
                                  );
                                }).toList(),
                          ),
                        );
                      },
                    );
                  },
                  child: AbsorbPointer(
                    // Prevents default dropdown behavior
                    child: DropdownButtonFormField<String>(
                      value: _selectedRole,
                      hint: Text(
                        context.l10n.selectRole,
                        style: AppTextStyles.fontD8.copyWith(
                          color: AppColors.color7,
                        ),
                      ),
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: '',
                        labelStyle: AppTextStyles.fontD8.copyWith(
                          color: AppColors.color7,
                        ),
                        hintText: context.l10n.selectRole,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            "assets/icons/work.svg",
                            width: 10,
                            height: 10,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: AppColors.color10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: AppColors.color10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: AppColors.color10),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      items:
                          roles.map((role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(
                                role,
                                style: AppTextStyles.fontD8.copyWith(
                                  color: AppColors.fontBlackColor,
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value;
                        });
                      },
                    ),
                  ),
                ),
                const Gap(16),
                // Start Date Picker
                Row(
                  children: [
                    Expanded(
                      child: _datePicker(true, context.l10n.today, _startDate, (
                        selectedDate,
                      ) {
                        if (selectedDate != null &&
                            (_endDate != null &&
                                selectedDate.isAfter(_endDate!))) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(context.l10n.msg_start_date),
                            ),
                          );
                        } else {
                          setState(() {
                            _startDate = selectedDate;
                          });
                        }
                      }),
                    ),

                    // SVG Icon in between
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset(
                        "assets/icons/arrow_right.svg", // Replace with your icon
                        width: 24, // Adjust size as needed
                        height: 24,
                      ),
                    ),

                    Expanded(
                      child: _datePicker(false, context.l10n.noDate, _endDate, (
                        selectedDate,
                      ) {
                        if (selectedDate != null &&
                            selectedDate.isBefore(_startDate!)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(context.l10n.msg_end_date)),
                          );
                        } else {
                          setState(() {
                            _endDate = selectedDate;
                          });
                        }
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Divider(color: AppColors.color10),
          // ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensures it only takes required space
              children: [
                Divider(
                  color: AppColors.color10,
                  thickness: 1,
                ), // Divider above buttons
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          title: 'Cancel',
                          backgroundColor: AppColors.disableButtonColor,
                          textColor: AppColors.disableButtonTextColor,
                        ),
                        const Gap(16),
                        AppButton(
                          onPressed: _saveEmployee,
                          title: 'Save',
                          backgroundColor: AppColors.appBlueColor,
                          textColor: AppColors.appWhiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _datePicker(
    bool isStartDate,
    String label,
    DateTime? selectedDate,
    Function(DateTime?) onSelect, {
    double width = double.infinity, // Default full width, can be customized
  }) {
    return SizedBox(
      width: width, // Set the width dynamically
      child: GestureDetector(
        onTap: () async {
          final selectedDate = await showDialog(
            context: context,
            builder: (context) {
              return CustomCalendarDialog(isStartDate);
            },
          );
          onSelect(selectedDate);
        },
        child: AbsorbPointer(
          child: TextField(
            style: AppTextStyles.f7.copyWith(color: AppColors.fontBlackColor),
            controller: TextEditingController(
              text:
                  selectedDate == null
                      ? ''
                      : formatDate(selectedDate.toLocal().toString()),
            ),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: AppColors.color7),
              prefixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "assets/icons/event.svg",
                  width: 20,
                  height: 20,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: AppColors.color10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: AppColors.color10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: AppColors.color10),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ),
    );
  }

  void _saveEmployee() {
    if (_nameController.text.isEmpty ||
        _startDate == null ||
        _selectedRole == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.error_msg_on_form)));
      return;
    }

    final employee = Employee(
      name: _nameController.text,
      role: _selectedRole!,
      startDate: _startDate!,
      endDate: _endDate,
    );

    if (widget.employee == null) {
      context.read<EmployeeCubit>().addEmployee(employee);
    } else {
      context.read<EmployeeCubit>().updateEmployee(widget.employee!, employee);
    }

    Navigator.pop(context);
  }
}
