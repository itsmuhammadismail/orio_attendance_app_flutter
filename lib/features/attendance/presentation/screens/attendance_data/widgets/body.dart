import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance_data/widgets/month_listview.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance_data/widgets/table.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(child: MyText.h2('Attendance')),
              ),
            ],
          ),
        ),
        const MonthListView(),
        const MyTable(),
      ],
    );
  }
}
