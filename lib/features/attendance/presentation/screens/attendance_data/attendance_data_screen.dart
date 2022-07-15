import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance_data/widgets/body.dart';
import 'package:orio_attendance_app_flutter/shared/layout/layout.dart';

class AttendanceDataScreen extends StatelessWidget {
  const AttendanceDataScreen({Key? key}) : super(key: key);

  static String id = "attendance_data_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(body: Body());
  }
}
