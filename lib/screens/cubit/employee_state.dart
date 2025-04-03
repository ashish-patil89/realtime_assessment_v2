import 'package:equatable/equatable.dart';

import '../../models/models.dart';

class EmployeeState extends Equatable {
  const EmployeeState({this.employees, this.employeeToDelete});

  final List<Employee>? employees;
  final Employee? employeeToDelete;

  EmployeeState copyWith({
    List<Employee>? employees,
    Employee? Function()? employeeToDelete,
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
      employeeToDelete:
          employeeToDelete != null ? employeeToDelete() : this.employeeToDelete,
    );
  }

  @override
  List<Object?> get props => [employees, employeeToDelete];
}
