import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/widgets/attendance_button.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/widgets/attendance_info.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/widgets/date_time.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/widgets/in_range_text.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance_data/attendance_data_screen.dart';
import 'package:orio_attendance_app_flutter/resources/constants.dart';
import 'package:orio_attendance_app_flutter/shared/routes/navigate.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: kDefaultPadding,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () =>
                      Navigate.to(context, AttendanceDataScreen.id),
                  icon: SvgPicture.asset('assets/icons/calender.svg')),
            ),
          ),
          const DateTimeShow(),
          const SizedBox(height: 20),
          const AttendanceButton(),
          const SizedBox(height: 20),
          const InRangeText(),
          const Expanded(child: SizedBox(height: 20)),
          const AttendanceInfo(),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
