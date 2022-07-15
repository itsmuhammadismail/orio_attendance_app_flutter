import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orio_attendance_app_flutter/resources/colors.dart';

class AttendanceButton extends StatelessWidget {
  const AttendanceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 172,
        height: 172,
        decoration: const BoxDecoration(
          gradient: kGradient,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/attendance_click.svg'),
            const SizedBox(height: 10),
            const Text('Check In',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
  }
}