import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/widgets/check_item.dart';

class AttendanceInfo extends StatelessWidget {
  const AttendanceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isInRange = true;

    return SizedBox(
      child: isInRange
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CheckItem(
                  icon: 'assets/icons/check_in.svg',
                  text: 'Check In',
                  time: '--:--',
                ),
                CheckItem(
                  icon: 'assets/icons/check_out.svg',
                  text: 'Check Out',
                  time: '--:--',
                ),
                CheckItem(
                  icon: 'assets/icons/hours.svg',
                  text: 'Working Hours',
                  time: '--:--',
                ),
              ],
            )
          : null,
    );
  }
}
