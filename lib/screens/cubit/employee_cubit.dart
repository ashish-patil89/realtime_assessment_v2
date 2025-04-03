import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/models.dart';
import 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(const EmployeeState()) {}

  Future<void> loadEmployees() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> employeeData = prefs.getStringList('employees') ?? [];
    List<Employee> employees =
        employeeData.map((data) {
          return Employee.fromMap(jsonDecode(data));
        }).toList();
    emit(state.copyWith(employees: employees));
  }

  Future<void> addEmployee(Employee employee) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> employeeData = prefs.getStringList('employees') ?? [];
    employeeData.add(jsonEncode(employee.toMap()));
    await prefs.setStringList('employees', employeeData);
    loadEmployees();
    emit(state.copyWith(employeeToDelete: () => null));
  }

  Future<void> deleteEmployee(Employee employee) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> employeeData = prefs.getStringList('employees') ?? [];
    employeeData.removeWhere((data) {
      return jsonEncode(employee.toMap()) == data;
    });
    await prefs.setStringList('employees', employeeData);
    loadEmployees();
    emit(state.copyWith(employeeToDelete: () => employee));
  }

  Future<void> updateEmployee(
    Employee oldEmployee,
    Employee updatedEmployee,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> employeeData = prefs.getStringList('employees') ?? [];
    int index = employeeData.indexWhere((data) {
      return jsonEncode(oldEmployee.toMap()) == data;
    });
    if (index != -1) {
      employeeData[index] = jsonEncode(updatedEmployee.toMap());
      await prefs.setStringList('employees', employeeData);
      loadEmployees();
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
