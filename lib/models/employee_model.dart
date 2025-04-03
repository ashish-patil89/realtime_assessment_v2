/// The model for employee.
class Employee {
  String name;
  String role;
  DateTime startDate;
  DateTime? endDate;

  Employee({
    required this.name,
    required this.role,
    required this.startDate,
    this.endDate,
  });

  // Convert Employee to Map for storage in SharedPreferences
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
    };
  }

  // Convert Map to Employee
  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      name: map['name'],
      role: map['role'],
      startDate: DateTime.parse(map['startDate']),
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
    );
  }
}
