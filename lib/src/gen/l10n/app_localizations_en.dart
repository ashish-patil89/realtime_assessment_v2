// ignore_for_file: constant_identifier_names, public_member_api_docs

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get employeeLists => 'Employee List';

  @override
  String get addEmployeeDetails => 'Add Employee Details';

  @override
  String get editEmployeeDetails => 'Edit Employee Details';

  @override
  String get error_msg_on_form => 'Please fill all required fields.';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get currentEmployees => 'Current employees';

  @override
  String get previousEmployees => 'Previous employees';

  @override
  String get selectRole => 'Select role';

  @override
  String get employeeName => 'Employee name';

  @override
  String get employeeDeleted => 'Employee data has been deleted';

  @override
  String get today => 'Today';

  @override
  String get noDate => 'No date';

  @override
  String get undo => 'UNDO';

  @override
  String get msg_start_date => 'Start date cannot be after then end date.';

  @override
  String get msg_end_date => 'End date cannot be before then start date.';
}
